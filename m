Content-Type: multipart/mixed; boundary="===============9119625704290575464=="
MIME-Version: 1.0
From: Eric W. Biederman <ebiederm@xmission.com>
To: lkp@lists.01.org
Subject: More information please. Re: [fs] 54cc07a761: BUG: kernel test crashed
Date: Mon, 25 Jul 2016 13:57:00 -0500
Message-ID: <877fc9a6mb.fsf@x220.int.ebiederm.org>
In-Reply-To: <5793dfa5.mvXPj4LJOS0dlz3i%xiaolong.ye@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9119625704290575464==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kernel test robot <xiaolong.ye@intel.com> writes:

> FYI, we noticed the following commit:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/ebiederm/user-namespace.g=
it for-testing
> commit 54cc07a761deb38318aca64ddf07fc45157c85e0 ("fs: Call d_automount wi=
th the filesystems creds")
>
> in testcase: boot
>
> on test machine: 1 threads qemu-system-x86_64 -enable-kvm -cpu Westmere w=
ith 320M memory
>
> caused below changes:
>
>
> +-------------------------+------------+------------+
> |                         | 8175435777 | 54cc07a761 |
> +-------------------------+------------+------------+
> | boot_successes          | 102        | 16         |
> | boot_failures           | 0          | 3          |
> | BUG:kernel_test_crashed | 0          | 3          |
> | timestamp.last          | 0          | 54.951425  |
> +-------------------------+------------+------------+
>
>
>
> [   19.206454] VFS: Warning: trinity-c0 using old stat() call. Recompile =
your binary.
>
> Elapsed time: 70
> BUG: kernel test crashed

What application generated the line "BUG: kernel test crashed."
What flavor of crash was this?

Given the last boot test failure that was reported to me was about 10
commits after the problem commit I unfortunately can't take it at face
value that the appropriate commit has been pinpointed.

If you could give me enough information to dig into this that would
be great.  Otherwise I am going to have to proceed forward on the basis
that this is a testing robot failure, and that the people who maintain
the testing robot don't care enough to look after it.

Eric

--===============9119625704290575464==--

