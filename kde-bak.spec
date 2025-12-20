# Redhat / Fedora / OpenSUSE RPM Spec

Name:           kde-bak
Version:        1.0.0
Release:        1%{?dist}
Summary:        Backup and restore KDE Plasma desktop settings

License:        MIT
URL:            https://example.invalid/kde-bak
Source0:        %{name}-%{version}.tar.gz

BuildArch:      noarch
Requires:       bash, rsync, tar
Requires:       kde-cli-tools

%description
kde-bak is a command-line utility for backing up and restoring KDE Plasma
desktop layouts, widgets, and configuration with safety checks and documentation.

%prep
%autosetup

%build
# nothing to build

%install
mkdir -p %{buildroot}/usr/bin
mkdir -p %{buildroot}/usr/share/man/man1
mkdir -p %{buildroot}/usr/share/applications
mkdir -p %{buildroot}/usr/share/doc/%{name}

install -m 0755 kde-bak %{buildroot}/usr/bin/kde-bak
install -m 0644 kde-bak.1 %{buildroot}/usr/share/man/man1/
install -m 0644 kde-bak.desktop %{buildroot}/usr/share/applications/
install -m 0644 README.md LICENSE %{buildroot}/usr/share/doc/%{name}/

%files
/usr/bin/kde-bak
/usr/share/man/man1/kde-bak.1*
/usr/share/applications/kde-bak.desktop
/usr/share/doc/%{name}

%changelog
* Sat Dec 20 2025 ChatGPT <opensource@openai.com> - 1.0.0-1
- Initial release

