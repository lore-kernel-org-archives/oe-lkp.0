Content-Type: multipart/mixed; boundary="===============8232843566370155427=="
MIME-Version: 1.0
From: Eric W. Biederman <ebiederm@xmission.com>
To: lkp@lists.01.org
Subject: Re: [mnt] 81e3bb1b6f: BUG:sleeping_function_called_from_invalid_context_at_fs/dcache.c
Date: Fri, 02 Dec 2016 21:05:22 -0600
Message-ID: <87r35pemq5.fsf@xmission.com>
In-Reply-To: <20161203022338.GA76683@inn.lkp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8232843566370155427==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kernel test robot <xiaolong.ye@intel.com> writes:

> FYI, we noticed the following commit:
>
> commit: 81e3bb1b6f6d84d47e773f34a14b0955e528c6eb ("mnt: Tuck mounts under=
 others instead of creating shadow/side mounts.")
> https://git.kernel.org/pub/scm/linux/kernel/git/ebiederm/user-namespace.g=
it for-testing
>
> in testcase: boot
>
> on test machine: qemu-system-x86_64 -enable-kvm -cpu host -smp 2 -m 1G
>
> caused below changes:

Bah.  Obvious in hind site...

Thank you testing robot,

Eric

--===============8232843566370155427==--

