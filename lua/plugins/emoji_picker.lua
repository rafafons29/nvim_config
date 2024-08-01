return {
  'WilsonOh/emoji_picker-nvim', -- Reemplaza con el nombre correcto del plugin
  lazy = true,
  opts = {
    window = {
      width = 25,
      height = 10,
    },
    emoji_list = {
      "😀😃😄😁😆🥹😅😂🤣🥲😊😇",
      "🙂🙃😉😌🥰😍😘😗😙😚😋😛",
      "😝😠😤😭😢🥺😩😫😖😣🙁😕",
      "😟😔😞😒😏🥳🤩🥸😎🤓🧐🤨",
      "🤪😜😡🤬🤯😳🥵🥶😶🌫️😱😨",
      "😰😥😓🤗🤔🫣🤭🫢🫡🤫🫠🤥",
      "😶🫥😐🫤😑🫨😬🙄😯😦😧😮",
      "😲🥱😴🤤😪😮💨😵😵💫🤐🥴",
      "🤢🤮🤧😷🤒🤕🤑🤠😈👿👹👺",
      "🤡💩👻💀👽👾🤖🎃😺😸😼😽",
      "😿😾🫶🤲👐🙌👏🤚✋👇👆👉",
      "🫴🤏🤌🤘🤟🤞🫸🫷🤜🤛✊👊",
      "👎👍🤝🖐️🖖🫱🦾💄🦻👃👣👁️",
      "👀🫀🫁🧠🗣️👤🫂👶🧒👨🧑🦱",
      "👩🦱👨🦱🧑🦰👨🦰👱🧑🦳👩",
      "🦳👨🦳🧑🦲👩🦲👨🦲🧔🧔🧓",
      "👵👴👲👳👳👳🧕👮👮👮👷👷",
      "💂💂🕵️🕵️🧑👨🧑🌾👩🌾🧑🎓",
      "👩🎓👩🎤👨🎤🧑🏫👩🏫👨🏫",
      "👩🏭🧑💼👩💼👨💼🧑🔧👩🔧",
      "🧑🔬🧑🔬👩🔬👨🔬🧑🎨👩🎨",
      "👨🎨🧑🚒👨🚒🧑👩👨👩👨👰",
      "🤵🦸🦸🦹🧙🧙🧝🧌🧛🧟🧟🧜",
      "🧚🫃🧑🍼👩🍼💁💁💁🙅🙆🤦",
      "🤷🙍🙍💇💇💇💆💆💆🧖🧖🧖",
      "🤳⚽️🏀🏈🥎🏑🪁🤾🤾🤺🤸🤸",
      "🤸🤼🤼🤼🏋️🏋️🏋️🪂🎿🥌🛷🛼",
      "🛹🎽🤾🏌️🏌️🏊🏊🤽🤽🚣🧗🧗",
      "🪇🎹🎼🎤🎬🎨🎭🤹🎟️🏵️🥈🥇",
      "🏆🚴🥁🪘🎷🪗🎸🪈🎲🧩⌚️📱",
      "🖥️🖨️🖱️📼📟💵💸🛢️🧯🕯️🔦💡",
      "🔌🪫🔋📡⏳⌛️🕰️⏰⏲️⏱️🧭🎚️🎙️",
      "📺💳💎⚖️🪜🧰🪛🔧🛠️⚙️🧲🪓🦠",
      "🧬🩸💉💊🩺🩹🕳️🔬🔭🪬🧿📿",
      "🔮🏺🪦🚬🛡️🗡️🔪🧫🌡️🧹🧺🚰",
      "🛁🛀🧼🪥🪒🪮🪣🧴🛎️🔑🗝️🚪",
      "🪑🛋️🛏️📧📨📩🧧🪩🎐🏮🪭🎎",
      "🎉🎊🪄🎀🎏🎈🛒🛍️🪟🖼️🪆🧸",
      "🛌💌📥📤📦🏷️🪧📪📫📯📜📃",
      "📊📈📉🗒️🗓️📆📅📇🧮📏📏📐",
      "🖇️📎🔖📖📚📙📘📗📒🗂️❌🚫",
      "📂📋🗄️🗳️🗃️📌📍🖊️🔓💚🖤🩶",
      "✅❗️❕❓❎☑️🔺🔻🔸🔹⚠️"
    },
  },
  keys = {
    { '<M-e>', cmd 'EmojiPicker', mode = 'i' } -- Mapea Alt+e para abrir el EmojiPicker en modo inserción
  }
}
