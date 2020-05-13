Content-Type: multipart/mixed; boundary="===============5483634244778782295=="
MIME-Version: 1.0
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: lkp@lists.01.org
Subject: Re: [selftests/bpf] da43712a72: kernel-selftests.bpf.make_fail
Date: Wed, 13 May 2020 12:26:34 +0200
Message-ID: <20200513102634.GC871114@kroah.com>
In-Reply-To: <20200513095835.GD102436@dhcp-12-153.nay.redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5483634244778782295==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2020 at 05:58:35PM +0800, Hangbin Liu wrote:
> =

> Thanks test bot catch the issue.
> On Wed, May 13, 2020 at 03:44:18PM +0800, kernel test robot wrote:
> > Greeting,
> > =

> > FYI, we noticed the following commit (built with gcc-7):
> > =

> > commit: 77bb53cb094828a31cd3c5b402899810f63073c1 ("selftests/bpf: Fix p=
erf_buffer test on systems w/ offline CPUs")
> > https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable-rc.git=
 linux-5.4.y
> =

> The author for this commit is Andrii(cc'd).
> =

> Mine is f1c3656c6d9c ("selftests/bpf: Skip perf hw events test if the set=
up disabled it")
> > prog_tests/stacktrace_build_id_nmi.c:55:3: error: label =E2=80=98cleanu=
p=E2=80=99 used but not defined
> >    goto cleanup;
> >    ^~~~
> =

> Hi Greg, we are missing a depend commit
> dde53c1b763b ("selftests/bpf: Convert few more selftest to skeletons").
> =

> So either we need backport this patch, or if you like, we can also fix it=
 by
> changing 'goto cleanup;' to 'goto close_prog;'. So which one do you prefe=
r?

I don't know, I have no context here at all, sorry.

What stable kernel tree is failing, what patch needs to be changed, what
patch caused this, and so on...

confused,

greg k-h
--===============5483634244778782295==--

