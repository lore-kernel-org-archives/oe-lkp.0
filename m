Content-Type: multipart/mixed; boundary="===============5710691485798305040=="
MIME-Version: 1.0
From: Johannes Berg <johannes@sipsolutions.net>
To: lkp@lists.01.org
Subject: Re: [gcov] 1391efa952: BUG:KASAN:slab-out-of-bounds_in_gcov_info_add
Date: Thu, 25 Nov 2021 16:45:07 +0100
Message-ID: <a5274ba1922d5eaf9568886191e0a05bdfc55506.camel@sipsolutions.net>
In-Reply-To: <20211125142622.GD3109@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============5710691485798305040==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 2021-11-25 at 14:26 +0000, Sang, Oliver wrote:
> =

> Greeting,
> =

> FYI, we noticed the following commit (built with clang-14):
> =

> commit: 1391efa952e8b22088f8626fc63ade26767b92d6 ("gcov: use kvmalloc()")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: boot
> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 16G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =


I don't think it actually *caused* the issue, but who knows? To me it
rather looks like it exposed an issue, which wasn't noticed before
because vmalloc() always allocates a page anyway? Assuming KASAN doesn't
track vmalloc() allocations more granular than their actual page-aligned
memory size (though perhaps it should?)

In any case, reviewing my commit again I see nothing wrong there, and I
don't understand the code/clang well enough to see what might be the
issue.

johannes
--===============5710691485798305040==--

