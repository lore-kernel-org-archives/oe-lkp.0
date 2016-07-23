Content-Type: multipart/mixed; boundary="===============4997378012637937970=="
MIME-Version: 1.0
From: Eric W. Biederman <ebiederm@xmission.com>
To: lkp@lists.01.org
Subject: Re: [fs] bdd20132c6: BUG: sleeping function called from invalid context at fs/proc/proc_sysctl.c:1569
Date: Sat, 23 Jul 2016 06:44:55 -0500
Message-ID: <878twsr32g.fsf@x220.int.ebiederm.org>
In-Reply-To: <5792dde7.0fHitzEpyzYl2u53%xiaolong.ye@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4997378012637937970==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kernel test robot <xiaolong.ye@intel.com> writes:

> FYI, we noticed the following commit:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/ebiederm/user-namespace.g=
it for-testing
> commit bdd20132c624a976f88b108ff37c7481c6f33e70 ("fs: Set s_user_ns to &i=
nit_user_ns in sget when MS_KERNMOUNT")
>
> in testcase: boot
>
> on test machine: 2 threads qemu-system-x86_64 -enable-kvm with 360M memory
>
> caused below changes:

Thank you for the report.  For anyone who is watching the change that
actually has the problem is:

a02420f1402ca76a6f2833c14fa82044cb2a0ae4 ("userns: Add per user namespace s=
ysctls.")

It looks like that change isn't ready.  Close but not quite.  Ah well.

Eric


--===============4997378012637937970==--

