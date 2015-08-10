Content-Type: multipart/mixed; boundary="===============8195740507461005401=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@amacapital.net>
To: lkp@lists.01.org
Subject: Re: [x86/build] b2c51106c75: -18.1% will-it-scale.per_process_ops
Date: Mon, 10 Aug 2015 13:39:39 -0700
Message-ID: <CALCETrVhdWVHeLtL72xtOU0qnQM8kVEeAOnxVKKw1tLVeW5Gsg@mail.gmail.com>
In-Reply-To: <20150805083858.GA21506@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8195740507461005401==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2015 at 1:38 AM, Ingo Molnar <mingo@kernel.org> wrote:
>
> * kernel test robot <ying.huang@intel.com> wrote:
>
>> FYI, we noticed the below changes on
>>
>> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/asm
>> commit b2c51106c7581866c37ffc77c5d739f3d4b7cbc9 ("x86/build: Fix detecti=
on of GCC -mpreferred-stack-boundary support")
>
> Does the performance regression go away reproducibly if you do:
>
>    git revert b2c51106c7581866c37ffc77c5d739f3d4b7cbc9
>
> ?

FWIW, I spot-checked the generated code.  All I saw were the deletion
of some dummy subtraction from rsp to align the stack for children,
changes of stack frame offsets, and a couple instances in which
instructions got reordered.

--Andy

--===============8195740507461005401==--

