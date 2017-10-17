Content-Type: multipart/mixed; boundary="===============1224115322483565218=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@kernel.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/mm] c4c3c3c2d0: will-it-scale.per_process_ops -61.0% regression
Date: Mon, 16 Oct 2017 18:06:25 -0700
Message-ID: <CALCETrW3G_RfMNKvw0katFuV6dB7k4AfUdVRZ603HNjY=bD4GQ@mail.gmail.com>
In-Reply-To: <20171016101548.v3l3jgcbdogrvbvh@pd.tnic>
List-Id: <oe-lkp.lists.linux.dev>

--===============1224115322483565218==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 16, 2017 at 3:15 AM, Borislav Petkov <bp@alien8.de> wrote:
> On Mon, Oct 16, 2017 at 10:39:17AM +0800, kernel test robot wrote:
>>
>> Greeting,
>>
>> FYI, we noticed a -61.0% regression of will-it-scale.per_process_ops due=
 to commit:
>>
>>
>> commit: c4c3c3c2d00826c88b5c02c20e80704664424b9b ("x86/mm: Flush more ag=
gressively in lazy TLB mode")
>> url: https://github.com/0day-ci/linux/commits/Borislav-Petkov/x86-mm-Flu=
sh-more-aggressively-in-lazy-TLB-mode/20171011-115901
>>
>>
>> in testcase: will-it-scale
>> on test machine: 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GHz wi=
th 64G memory
>
> Say what now?
>
> This is actually what got applied upstream:
>
> b956575bed91 ("x86/mm: Flush more aggressively in lazy TLB mode")
>
> and AFAICT, that machine is BDW and it should have PCID, right?
>
> Or wait, that's a guest so PCID is probably not even usable for guests.
> Or should we disable it in VMs?

PCID works on new versions of KVM, at least, depending on configuration.

On a PCID machine, with this patch applied, we are still switching CR3
when we go idle (which is presumably what we're hitting here) -- we're
just not flushing anything.  The main cost seems to come from
serialization.  On my laptop, I think I measured about 80 ns per
non-flushing CR3 load if I do it in a loop.  The cost is larger when
it's not in a loop because the pipeline is fuller, I assume.  We also
take a bit of a hit because switch_mm is a bit complex.  I have a
patch here to try to optimize it:

https://git.kernel.org/pub/scm/linux/kernel/git/luto/linux.git/commit/?h=3D=
x86/fixes&id=3D1caf24d080dac8b9f952600d1e91879aa782131c

On a non-PCID machine, this patch will increase IPIs, which doesn't
seem to be what we're seeing.

The test in question is basically the same thing as a test I ran with
very little in the way of visible regression.  I'm wondering if the
real problem is some NUMA oddity.

Xiaolong, can you send us /proc/cpuinfo on this kernel on the test
machine that's seeing this problem?

--Andy

--===============1224115322483565218==--

