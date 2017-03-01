Content-Type: multipart/mixed; boundary="===============6844880508950624443=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [locking/ww_mutex] 2a0c112828 WARNING: CPU: 0 PID: 18 at kernel/locking/mutex.c:305 __ww_mutex_wakeup_for_backoff
Date: Thu, 02 Mar 2017 01:39:16 +0800
Message-ID: <20170301173916.o7idcaqou3inwprx@wfg-t540p.sh.intel.com>
In-Reply-To: <20170301165406.GZ6485@twins.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============6844880508950624443==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 01, 2017 at 05:54:06PM +0100, Peter Zijlstra wrote:
>On Wed, Mar 01, 2017 at 04:26:48PM +0000, Chris Wilson wrote:
>> On Wed, Mar 01, 2017 at 04:11:48PM +0000, Chris Wilson wrote:
>> > On Wed, Mar 01, 2017 at 04:54:14PM +0100, Peter Zijlstra wrote:
>> > > On Wed, Mar 01, 2017 at 11:40:43PM +0800, Fengguang Wu wrote:
>> > > > Thanks for the patch! I applied the patch on top of "locking/ww_mu=
tex:
>> > > > Add kselftests for ww_mutex stress", and find no "bad unlock balan=
ce
>> > > > detected" but this warning. Attached is the new dmesg which is a b=
it
>> > > > large due to lots of repeated errors.
>> > >
>> > > So with all the various patches it works for me.
>> > >
>> > > I also have the following on top; which I did when I was looking thr=
ough
>> > > this code trying to figure out wth was happening.
>> > >
>> > > Chris, does this make sense to you?
>> > >
>> > > It makes each loop a fully new 'instance', otherwise we'll never upd=
ate
>> > > the ww_class->stamp and the threads will aways have the same order.
>> >
>> > Sounds ok, I just thought the stamp order of the threads was
>> > immaterial - with each test doing a different sequence of locks and ea=
ch
>> > being identical in behaviour, it would not matter which had priority,
>> > there would have be some shuffling no matter waht. However, for the
>> > purpose of testing, having each iteration be a new locking instance do=
es
>> > make it behaviour more like a typical user.
>>
>> Correcting myself, the workers didn't reorder the locks, so changing the
>> stamp does make the test more interesting.
>
>OK, so I'll go write a Changelog for it then ;-) And stick your ACK on.

With both patches in this thread, all 110 boots are successful w/o a
single warning.

Tested-by: Fengguang Wu <fengguang.wu@intel.com>

Thanks,
Fengguang

--===============6844880508950624443==--

