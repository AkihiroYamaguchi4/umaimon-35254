document.addEventListener('load', () => {
  console.log("konn")
 
  // カレンダーの日本語化
   flatpickr.localize(flatpickr.l10ns.ja)
   // カレンダー表示
   flatpickr('#flatpickr', {
     // スマートフォンでもカレンダーに「flatpickr」を使用する設定
     disableMobile: true,
   });
})