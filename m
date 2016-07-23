Content-Type: multipart/mixed; boundary="===============6741391383154034499=="
MIME-Version: 1.0
From: Eric W. Biederman <ebiederm@xmission.com>
To: lkp@lists.01.org
Subject: Re: [fs] 54cc07a761: BUG: kernel test crashed
Date: Sat, 23 Jul 2016 16:52:48 -0500
Message-ID: <87y44snhsf.fsf@x220.int.ebiederm.org>
In-Reply-To: <5793dfa5.mvXPj4LJOS0dlz3i%xiaolong.ye@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6741391383154034499==
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

The problem here seems to be the line: "BUG: kernel test crashed"
Can someone give me some clarity on what that refers to?

My experience in the last week indicates I can't trust the commit the
test bot tells me is the problem commit on these tests.  So if there is
an issue I need something more to track it down with than a line of
output I don't have the source to.

Eric

--===============6741391383154034499==--

