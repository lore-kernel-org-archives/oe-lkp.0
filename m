Content-Type: multipart/mixed; boundary="===============5272911410878177559=="
MIME-Version: 1.0
From: Ingo Molnar <mingo@kernel.org>
To: lkp@lists.01.org
Subject: Re: ce56a86e2a ("x86/mm: Limit mmap() of /dev/mem to valid physical addresses"): kernel BUG at arch/x86/mm/physaddr.c:79!
Date: Thu, 26 Oct 2017 21:02:29 +0200
Message-ID: <20171026190229.zt743ooxvjsukmis@gmail.com>
In-Reply-To: <CAOJUGycO494NcvJk89MMub9Tbrj6FUoSNN4SOci7NgJRKq7v=A@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5272911410878177559==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


* Craig Bergstrom <craigb@google.com> wrote:

> Sander, thanks for the details, they've been very useful.
> =

> I suspect that your host system's mem=3D2048M parameter is causing the
> problem.  Any chance you can confirm by removing the parameter and
> running the guest code path?
> =

> More specifically, since you're telling the kernel that it's high
> memory address is at 2048M and your device is at 0xfe1fe000 (~4G), the
> new mmap() limits are preventing you from mapping addresses that are
> explicitly disallowed by the parameter.

Well, 'mem=3D2048M' shouldn't really limit device memory, it's supposed to =
limit =

(trim) 'RAM' and not much else.

Thanks,

	Ingo

--===============5272911410878177559==--

