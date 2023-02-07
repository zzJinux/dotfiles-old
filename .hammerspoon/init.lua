do  -- input sorce changer
  local inputSource = {
    english = "com.apple.keylayout.ABC",
    korean = "com.apple.inputmethod.Korean.2SetKorean",
  }

  local changeInput = function()

    local current = hs.keycodes.currentSourceID()
    local nextInput = nil

    if current ~= inputSource.korean then
      nextInput = inputSource.korean
    else
      nextInput = inputSource.english
    end
    hs.keycodes.currentSourceID(nextInput)
  end

  hs.hotkey.bind({}, 'F15', changeInput)
end
