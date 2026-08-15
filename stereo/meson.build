sound_files = [
  'alarm-clock-elapsed.oga',
  'audio-channel-front-center.oga',
  'audio-channel-front-left.oga',
  'audio-channel-front-right.oga',
  'audio-channel-rear-center.oga',
  'audio-channel-rear-left.oga',
  'audio-channel-rear-right.oga',
  'audio-channel-side-left.oga',
  'audio-channel-side-right.oga',
  'audio-test-signal.oga',
  'audio-volume-change.oga',
  'bell.oga',
  'camera-shutter.oga',
  'complete.oga',
  'device-added.oga',
  'device-removed.oga',
  'dialog-information.oga',
  'dialog-warning.oga',
  'message.oga',
  'message-new-instant.oga',
  'phone-incoming-call.oga',
  'phone-outgoing-busy.oga',
  'phone-outgoing-calling.oga',
  'service-login.oga',
  'service-logout.oga',
  'suspend-error.oga',
  'trash-empty.oga',
  'trash-put.oga',
]

install_data(sound_files, install_dir: stereo_dir)

# Compatibility symlinks
symlinks = {
  'power-plug.oga':                     'device-added.oga',
  'power-unplug.oga':                   'device-removed.oga',
  'network-connectivity-established.oga': 'device-added.oga',
  'network-connectivity-lost.oga':      'device-removed.oga',
  'screen-capture.oga':                 'camera-shutter.oga',
  'dialog-error.oga':                   'dialog-warning.oga',
  'window-attention.oga':               'dialog-warning.oga',
  'window-question.oga':                'dialog-warning.oga',
}

foreach link, target : symlinks
  install_symlink(
    link,
    pointing_to: target,
    install_dir: stereo_dir,
  )
endforeach
