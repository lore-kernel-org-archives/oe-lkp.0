Content-Type: multipart/mixed; boundary="===============2787388874246700600=="
MIME-Version: 1.0
From: Alexey Dobriyan <adobriyan@gmail.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [proc] 89d98ff979: kernel_selftests.proc.proc-loadavg-001.fail
Date: Tue, 17 Apr 2018 21:40:42 +0300
Message-ID: <20180417184042.GA20340@avx2>
In-Reply-To: <20180417025426.GB17434@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============2787388874246700600==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 17, 2018 at 10:54:26AM +0800, kernel test robot wrote:
> =

> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: 89d98ff9795717225187dd20c5c557ef16c37372 ("proc: add selftest for=
 last field of /proc/loadavg")

Fixed by https://marc.info/?l=3Dlinux-kernel&m=3D152364205819862&w=3D4
[PATCH] proc: fix /proc/loadavg regression

--===============2787388874246700600==--

