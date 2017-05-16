Content-Type: multipart/mixed; boundary="===============7828870434028177584=="
MIME-Version: 1.0
From: Al Viro <viro@ZenIV.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [asm] c1aad8dcc4: BUG:kernel_hang_in_boot_stage
Date: Tue, 16 May 2017 02:29:58 +0100
Message-ID: <20170516012958.GP390@ZenIV.linux.org.uk>
In-Reply-To: <20170516011957.GB17692@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============7828870434028177584==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 16, 2017 at 09:19:57AM +0800, kernel test robot wrote:
> =

> FYI, we noticed the following commit:
> =

> commit: c1aad8dcc49382399f48541dc47b6e30b0ef1b62 ("asm-generic: zero in _=
_get_user(), not __get_user_fn()")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: trinity
> with following parameters:
> =

> 	runtime: 300s
> =

> test-description: Trinity is a linux system call fuzz tester.
> test-url: http://codemonkey.org.uk/projects/trinity/
> =

> =

> on test machine: qemu-system-x86_64 -enable-kvm -smp 2 -m 420M

Huh?  That commit touches only include/asm-generic/uaccess.h and
this file is not even looked at during x86 builds.

--===============7828870434028177584==--

