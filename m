Content-Type: multipart/mixed; boundary="===============1223164562061148983=="
MIME-Version: 1.0
From: Andrey Konovalov <andreyknvl@google.com>
To: lkp@lists.01.org
Subject: Re: 545b8a22e9 BUG: kernel reboot-without-warning in test stage
Date: Mon, 03 Sep 2018 17:02:52 +0200
Message-ID: <CAAeHK+wpuZdvL5HEWdzHb2xRwGDyUXF4JhLShvjribxgv9u4Og@mail.gmail.com>
In-Reply-To: <20180903022808.GA29179@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============1223164562061148983==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 3, 2018 at 4:28 AM, kernel test robot <rong.a.chen@intel.com>=
 wrote:
> Greetings,
>
> 0day kernel testing robot got the below dmesg and the first bad commit is
>
> https://github.com/0day-ci/linux/commits/Andrey-Konovalov/khwasan-kernel-=
hardware-assisted-address-sanitizer/20180830-045630
>
> commit 545b8a22e9764e9783a4019ba12a3a1ac71c7c71
> Author:     Andrey Konovalov <andreyknvl@google.com>
> AuthorDate: Wed Aug 29 13:35:06 2018 +0200
> Commit:     0day robot <lkp@intel.com>
> CommitDate: Thu Aug 30 04:56:31 2018 +0800
>
>     khwasan: move common kasan and khwasan code to common.c
>
>     KHWASAN will reuse a significant part of KASAN code, so move the comm=
on
>     parts to common.c without any functional changes.
>
>     Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
>

Tried building the kernel with the provided config and running the
provided qemu script on the clean upstream kernel and got "reboot:
machine restart" after 90 seconds, so this seems to be wrongly
attributed.

--===============1223164562061148983==--

