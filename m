Content-Type: multipart/mixed; boundary="===============7069945034547391553=="
MIME-Version: 1.0
From: Luis R. Rodriguez <mcgrof@kernel.org>
To: lkp@lists.01.org
Subject: Re: [test] 265bbb5704: BUG: unable to handle kernel paging request at e8e04dec
Date: Tue, 19 Apr 2016 10:10:31 +0100
Message-ID: <CAB=NE6Wz_kaB78_v7hMx_MPj4S92dAEUq3q7YwoA33aF28rcNQ@mail.gmail.com>
In-Reply-To: <20160419085902.GA31551@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7069945034547391553==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 19, 2016 at 9:59 AM, Fengguang Wu <fengguang.wu@intel.com> wr=
ote:
> Hi Luis,
>
> On Tue, Apr 19, 2016 at 09:14:16AM +0100, Luis R. Rodriguez wrote:
>> On Apr 19, 2016 3:29 AM, "Fengguang Wu" <fengguang.wu@intel.com> wrote:
>> >
>> > Luis, thank you for the feedback!
>> >
>> > Xiaolong/Philip, would you help have a check?
>>
>> I got notifications for the new branch now!
>>
>> However there were a few branches for which I never got anything. It
>
> I see a number of trees under
>
> http://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/
>
> alx.git/                     11-Mar-2016 10:53    -
> backports.git/               07-Mar-2016 09:50    -
> compat-drivers-old.git/      17-Mar-2016 09:31    -
> compat-wireless-2.6-old.git/ 22-Mar-2016 09:55    -
> crda.git/                    02-Mar-2016 09:45    -
> linker-tables.git/           04-Mar-2016 10:08    -
> linux-framebuffer.git/       04-Mar-2016 11:18    -
> linux-next.git/              04-Apr-2016 09:51    -
> linux-pci.git/               24-Feb-2016 10:23    -
> linux-x86.git/               25-Feb-2016 11:34    -
> linux-xen.git/               23-Feb-2016 13:53    -
> linux.git/                   14-Apr-2016 10:52    -
> qca-swiss-army-knife.git/    15-Mar-2016 11:34    -
> rel-html.git/                15-Mar-2016 11:41    -
> wireless-regdb.git/          03-Mar-2016 11:58    -
>
>> was unclear why, and I felt the right thing to do was ask instead of
>> needlessly add more load to 0-day unless I really needed it (which in
>> the end, I did after a new respin of patches). You guys do awesome
>> work, so don't mind me -- unless told otherwise I'll assume that after
>> 2 days if I don't hear back from 0-day something went wrong and I
>> should feel free to push a new branch for testing,
>
> Currently we only send build success notifications for the above
> linux-next.git tree.

I get notifications also for the linux.git tree. I need only
notifications for my linux.git and linux-next.git tree, I should
remove all other linux kernel trees.

> Would you like adding more of the above trees to
> the notify list? Test load is not a problem for us.

That's amazing! Thanks but I need only two trees:

  * linux.git
  * linux-next.git

>> in the future
>> however it would be nice if I could go to a place to check status of
>> testing so I don't have to bug you guys / guess if something went
>> wrong.
>
> Yeah sorry, there are no web page for build status. You may rely on
> the notification emails for similar functionality.  If the email is
> not sent out in half day, something must go wrong and we'd like be
> informed of the problem.

Oh OK then I did the right thing to notify you folks, thanks!

 Luis

--===============7069945034547391553==--

