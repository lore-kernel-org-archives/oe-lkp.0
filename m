Content-Type: multipart/mixed; boundary="===============3942332920524724937=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [x86, perf] 7aba70e47c: BUG: unable to handle kernel paging request at 696d2f62
Date: Fri, 20 Nov 2015 08:45:10 +0800
Message-ID: <874mghijmx.fsf@yhuang-dev.intel.com>
In-Reply-To: <20151119111443.GK3816@twins.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============3942332920524724937==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, Peter,

Peter Zijlstra <peterz@infradead.org> writes:

> On Thu, Nov 19, 2015 at 08:38:58AM +0800, Huang, Ying wrote:
>> Hi, Peter,
>> =

>> Peter Zijlstra <peterz@infradead.org> writes:
>> =

>> > On Wed, Nov 18, 2015 at 02:33:00PM +0800, kernel test robot wrote:
>> >> FYI, we noticed the below changes on
>> >> =

>> >> https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git perf=
/core
>> >> commit 7aba70e47ca4e961acb5af96d5127e3fad651c7c ("x86, perf: Optimize=
 stack walk user accesses")
>> >
>> > Of course, that commit no longer exists. I re-create the tree every ti=
me
>> > I push it, this means that if you report something a few days later, i=
ts
>> > highly likely its against non-existant commits :/
>> =

>> I am sorry about this.  We will try our best to reach real 0day
>> reporting.
>
> Is there any way I can monitor the progress of a given tree through the
> whole 0-day testing farm? I know the various compile tests are complete
> because those send email. But after that it goes off into magic land
> without further feedback, unless something bad happens as per this
> report.
>
> It would be useful for me to know how far along a given tree is before I
> zap it.

So far, we have no such features like 'boot/functionality/performance
test complete' or progress report email.  But I think that could be a
useful features for many people.   We will add it to the TODO of 0day.

Best Regards,
Huang, Ying

--===============3942332920524724937==--

