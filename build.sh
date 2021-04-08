set -e
set -u

rm -rf ./tmp/
mkdir -p ./tmp/
cat ./nav/index.md >> ./tmp/index.md

my_articles="$(for my_file in src/*.md; do

    my_created="$(git log --date=iso-local --pretty=tformat:'%ad' "${my_file}" | tail -n 1 | cut -d' ' -f1-2)"

    my_updated="$(git log -1 --date=iso-local --pretty=tformat:'%ad' "${my_file}" | cut -d' ' -f1)"

    printf '%s %s %s\n' "${my_created} ${my_updated} ${my_file}"
done)"

rm -rf ./build/
mkdir -p ./build/
printf '%s\n' "${my_articles}" | while read my_article; do
    my_file="$(printf '%s' "$my_article" | cut -c 32-)"
    my_created="$(printf '%s' "$my_article" | cut -c 1-10)"
    my_updated="$(printf '%s' "$my_article" | cut -c 21-30)"

    my_article="$(basename ${my_file} '.md')"

    printf "Adding ${my_article}.html\n"

    my_partial="$(comrak -c "./scripts/comrak.config" "src/${my_article}.md")"
    sd -p '\{\{content\}\}' "${my_partial}" page.tpl.html \
        >> "./tmp/${my_article}.tmp1.html"
    sd -p '\{\{created_at\}\}' "${my_created}" "./tmp/${my_article}.tmp1.html" \
        >> "./build/${my_article}.html"
    rm -rf "./tmp/${my_article}".tmp*.html

    # grep '\S' "src/${my_article}.md" # select non-empty lines from file
    # head -n 1                        # grab first (non-empty line)
    # grep '^#      # select a line starting with '# ', or select nothing
    # cut -c 3-     # select from the 3rd character (of that line) onward
    # true          # ignore failure (i.e. no matching lines)
    my_title="$(grep '\S' "src/${my_article}.md" | head -n 1 | grep '^# ' | cut -c 3- || true)"

    printf -- "- ${my_created} [${my_title:-${my_article}}](./${my_article}.html) (edited ${my_updated})\n" >> ./tmp/index.md

done

my_partial="$(comrak -c "./scripts/comrak.config" './nav/contact.md')"

my_article="contact"
my_created=""
sd -p '\{\{content\}\}' "${my_partial}" page.tpl.html \
    >> "./tmp/${my_article}.tmp1.html"
sd -p '\{\{created_at\}\}' "${my_created}" "./tmp/${my_article}.tmp1.html" \
    >> "./build/${my_article}.html"
rm -rf "./tmp/${my_article}.md"

my_partial="$(comrak -c "./scripts/comrak.config" './tmp/index.md')"

my_article="index"
my_created=""
sd -p '\{\{content\}\}' "${my_partial}" page.tpl.html \
    >> "./tmp/${my_article}.tmp1.html"
sd -p '\{\{created_at\}\}' "${my_created}" "./tmp/${my_article}.tmp1.html" \
    >> "./build/${my_article}.html"
rm -rf "./tmp/${my_article}.md"

rsync -avhP ./assets/ build/assets/
