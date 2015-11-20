Content-Type: multipart/mixed; boundary="===============6840289350647937698=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86, perf] 7aba70e47c: BUG: unable to handle kernel paging request at 696d2f62
Date: Fri, 20 Nov 2015 08:38:24 +0800
Message-ID: <87oaepo67z.fsf@yhuang-dev.intel.com>
In-Reply-To: <20151119191803.GB8802@tassilo.jf.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6840289350647937698==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, Andi,

Andi Kleen <ak@linux.intel.com> writes:

> On Wed, Nov 18, 2015 at 05:27:42PM +0100, Peter Zijlstra wrote:
>> On Wed, Nov 18, 2015 at 02:33:00PM +0800, kernel test robot wrote:
>> > FYI, we noticed the below changes on
>> > =

>> > https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git perf/=
core
>> > commit 7aba70e47ca4e961acb5af96d5127e3fad651c7c ("x86, perf: Optimize =
stack walk user accesses")
>> =

>> Of course, that commit no longer exists. I re-create the tree every time
>> I push it, this means that if you report something a few days later, its
>> highly likely its against non-existant commits :/
>> =

>> > [   21.984049] BUG: unable to handle kernel paging request at 696d2f62
>> > [   21.986759] IP: [<4110c023>] perf_prepare_sample+0xcc/0x51d
>> > [   21.987859] *pdpt =3D 0000000001a93001 *pde =3D 0000000000000000 =

>> > [   21.988015] Oops: 0000 [#1] PREEMPT =

>> > [   21.988015] Modules linked in:
>> > [   21.988015] CPU: 0 PID: 496 Comm: trinity-main Not tainted 4.3.0-01=
147-g7aba70e #1
>> =

>> That doesn't actually look like something the fingered patch touches.
>> And seeing how its trinity triggering it, I suspect bisection fail.
>
> Ok. I assume it's not caused by my patch.  Let me know if that is wrong.

Sorry about false positive.

> I also pushed the patch before to my tree (which is 0day tested) and there
> was no such report (but of course trinity is somewhat random).
>
> BTW if you're going to test trinity for perf it may be better to use
> Vince Weaver's version here
>
> https://github.com/deater/perf_event_tests
>
> which has more coverage for perf than normal trinity.

Thanks for your information.  We will integrate it into 0day tests.

Best Regards,
Huang, Ying

--===============6840289350647937698==--

