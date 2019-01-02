Content-Type: multipart/mixed; boundary="===============7905653422901345223=="
MIME-Version: 1.0
From: Rafael J. Wysocki <rafael@kernel.org>
To: lkp@lists.01.org
Subject: Re: [mtd] c4dfa25ab3: kernel_BUG_at_fs/sysfs/file.c
Date: Wed, 02 Jan 2019 22:44:50 +0100
Message-ID: <CAJZ5v0hXEqtaiV56sGCOd1VzsRETkS39YiLV-OfnFWiZH4tcAQ@mail.gmail.com>
In-Reply-To: <CAHk-=wh2sparb1qw4h5QTCR+YF7xsssLgZtNtthRA6QiJjKfbA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7905653422901345223==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 2, 2019 at 8:53 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:

[cut]

> Greg, Rafael: it does strike me that the "BUG_ON()" in
> sysfs_create_file_ns() could easily have been a
>
>         if (WARN_ON(..))
>                 return -EINVAL;
>
> which would have made the machine boot and probably make things easier
> for normal users to report. The kernel test robot doesn't care, but
> non-booting kernels are usually not nice to debug or report for normal
> human beings..

I agree.

This isn't a good enough reason to crash the kernel IMO.

Cheers,
Rafael

--===============7905653422901345223==--

