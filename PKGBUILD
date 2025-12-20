# Arch Package Build

pkgname=kde-bak
pkgver=1.0.0
pkgrel=1
pkgdesc="Backup and restore KDE Plasma desktop settings"
arch=('any')
url="https://example.invalid/kde-bak"
license=('MIT')
depends=('bash' 'rsync' 'tar' 'kde-cli-tools')
source=("$pkgname-$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  install -Dm755 kde-bak "$pkgdir/usr/bin/kde-bak"
  install -Dm644 kde-bak.1 "$pkgdir/usr/share/man/man1/kde-bak.1"
  install -Dm644 kde-bak.desktop "$pkgdir/usr/share/applications/kde-bak.desktop"
  install -Dm644 README.md LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
}

