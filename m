Content-Type: multipart/mixed; boundary="===============6716146386621226649=="
MIME-Version: 1.0
From: Ingo Molnar <mingo@kernel.org>
To: lkp@lists.01.org
Subject: Re: 9f4835fb96 ("x86/fpu: Tighten validation of user-supplied .."): Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
Date: Sun, 24 Sep 2017 12:00:53 +0200
Message-ID: <20170924100053.26orenha4udgubtg@gmail.com>
In-Reply-To: <59c6e23f.nOk6ceVoId2JVMIx%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6716146386621226649==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


* kernel test robot <fengguang.wu@intel.com> wrote:

> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git WIP.x86/fpu
> =

> commit 9f4835fb965d8eea7e608d0cb62c246c804dec90
> Author:     Eric Biggers <ebiggers@google.com>
> AuthorDate: Fri Sep 22 10:41:55 2017 -0700
> Commit:     Ingo Molnar <mingo@kernel.org>
> CommitDate: Sat Sep 23 11:02:00 2017 +0200
> =

>     x86/fpu: Tighten validation of user-supplied xstate_header

So unfortunately the crash log was not extracted properly by the bot, so we=
 only =

know the subject line:

   Kernel panic - not syncing: Attempted to kill init! exitcode=3D0x0000000b

One possibility would be for this memcpy() in copy_kernel_to_xstate() to ca=
use the =

crash:

        memcpy(&hdr, kbuf + offset, size);

where 'size' increased from:


	size =3D sizeof(xfeatures);

which was 8 bytes, to:

	size =3D sizeof(hdr);

which is 64 bytes.

What guarantees that 'kbuf + offset + size-1' is still within the kbuf buff=
er? =

AFAICS 'kbuf' gets validated with fpu_user_xstate_size.

... I might be barking up the wrong tree, but I don't see this guaranteed, =
at =

least not in any obvious way.

In hindsight, I think we need to split up this commit:

  x86/fpu: Tighten validation of user-supplied xstate_header

Into at least 5-6 parts (!), as it's way too large and risky.

Here is the split-up I'd suggest:

1)

Introduce the new validate_xstate_header() function - without actually usin=
g it.

2)

Change xstateregs_set() to use validate_xstate_header() and change the beha=
vior of =

reserved bits. Since this impacts the ABI we better have this as a standalo=
ne, =

bisectable patch.

3)

Change sanitize_restored_xstate() to use the new validate_xstate_header().

4)

Change copy_kernel_to_xstate() to introduce the new on-kernel-stack header =
copy, =

but don't yet update the rest of the code, just initialize 'xfeatures' from=
 the =

header copy and leave the rest unchanged.

5)

Fix copy_kernel_to_xstate() to now use the header properly, pass it to =

validate_xstate_header() and get rid of the 'xfeatures' local variable, etc.
  =

6)

Also, while this change looks correct but it's unrelated and spurious:
 =

-       if (boot_cpu_has(X86_FEATURE_XSAVES)) {
+       if (using_compacted_format()) {

and using_compacted_format() is a stupidly global function that adds overhe=
ad =

unnecessarily:

int using_compacted_format(void)
{
        return boot_cpu_has(X86_FEATURE_XSAVES);
}

It should be a static inline instead.

Thanks,

	Ingo

--===============6716146386621226649==--

