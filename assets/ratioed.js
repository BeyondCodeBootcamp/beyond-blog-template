;(() => {
  const ratioed = () => {
    ;[...document.querySelectorAll('iframe:not([data-ratioed])')].forEach(
      (iframe) => {
        const styles = window.getComputedStyle(iframe)
        const height = iframe.height || Number.parseInt(styles.height, 10)
        const width = iframe.width || Number.parseInt(styles.width, 10)
        const ratio = height / width

        const wrapper = document.createElement('div')
        // wrapper.classList.add('ratioed')
        wrapper.style.paddingBottom = `${ratio * 100}%`
        wrapper.classList.add('ratioed')

        iframe.parentNode.replaceChild(wrapper, iframe)
        wrapper.appendChild(iframe)
        iframe.removeAttribute('height')
        iframe.removeAttribute('width')
        iframe.dataset.ratioed = ratio
      }
    )
  }
  document.addEventListener('DOMContentLoaded', ratioed)
  const observer = new MutationObserver((mutationsList) => {
    mutationsList.forEach(ratioed)
  })
  observer.observe(document.body, { childList: true, subtree: true })
})()
