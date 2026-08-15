project('sound-theme-freedesktop', version: '0.7')

i18n = import('i18n')

theme_dir = get_option('datadir') / 'sounds' / 'freedesktop'
stereo_dir = theme_dir / 'stereo'

# Generate index.theme from index.theme.in with translated strings
i18n.merge_file(
  input: 'index.theme.in',
  output: 'index.theme',
  type: 'desktop',
  po_dir: 'po',
  install: true,
  install_dir: theme_dir,
)

subdir('stereo')
subdir('po')
