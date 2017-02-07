Content-Type: multipart/mixed; boundary="===============4241912043531390513=="
MIME-Version: 1.0
From: Cyril Hrubis <chrubis@suse.cz>
To: lkp@lists.01.org
Subject: Re: [LTP] [lkp-robot] [fs] 99f64a2676: ltp.creat08.fail & ltp.open10.fail
Date: Tue, 07 Feb 2017 16:12:43 +0100
Message-ID: <20170207151219.GA3595@rei.suse.cz>
In-Reply-To: <20170206025942.GC21111@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============4241912043531390513==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi!
> FYI, we noticed the following commit:
> =

> commit: 99f64a2676f0bec4ad32e39fc76eb0914ee091b8 ("fs: Harden against ope=
n(..., O_CREAT, 02777) in a setgid directory")
> https://git.kernel.org/pub/scm/linux/kernel/git/luto/linux.git vfs/suid
> =

> in testcase: ltp
> with following parameters:
> =

> 	test: ltplite
> =

> test-description: The LTP testsuite contains a collection of tools for te=
sting the Linux kernel and related features.
> test-url: http://linux-test-project.github.io/

Looking at the testcases in question these are testing exactly the
corner case the patch is fixing.

So the tests needs to be fixed once this patch hits mainline. And the
best fix is to expect the SGID flag to be cleared on newer kernels.

-- =

Cyril Hrubis
chrubis(a)suse.cz

--===============4241912043531390513==--

