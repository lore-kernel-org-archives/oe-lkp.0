Content-Type: multipart/mixed; boundary="===============3301883609344879994=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-developer] [sched/fair] 4e5160766f: +149% ftq.noise.50% regression
Date: Tue, 28 Feb 2017 08:33:27 +0800
Message-ID: <87tw7ff92g.fsf@yhuang-dev.intel.com>
In-Reply-To: <CAKfTPtBN+NmOXREQK6v-_dfrcDNux-BUG0A7xk3oOj-s7t37Bg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3301883609344879994==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Vincent Guittot <vincent.guittot@linaro.org> writes:

> Hi Ying,
>
> On 21 February 2017 at 03:40, Huang, Ying <ying.huang@intel.com> wrote:
>> Hi, Vincent,
>>
>> Vincent Guittot <vincent.guittot@linaro.org> writes:
>>
>
> [snip]
>
>>>>
>>>> Here is the test result,
>>>>
>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> compiler/cpufreq_governor/freq/kconfig/nr_task/rootfs/samples/tbox_gro=
up/test/testcase:
>>>>   gcc-6/powersave/20/x86_64-rhel-7.2/100%/debian-x86_64-2016-08-31.cgz=
/6000ss/lkp-hsw-d01/cache/ftq
>>>>
>>>> commit:
>>>>   4e5160766fcc9f41bbd38bac11f92dce993644aa: first bad commit
>>>>   09a43ace1f986b003c118fdf6ddf1fd685692d49: parent of first bad commit
>>>>   b524060933c546fd2410c5a09360ba23a0fef846: with fix patch above
>>>>
>>>> 4e5160766fcc9f41 09a43ace1f986b003c118fdf6d b524060933c546fd2410c5a093
>>>> ---------------- -------------------------- --------------------------
>>>>          %stddev     %change         %stddev     %change         %stdd=
ev
>>>>              \          |                \          |                \
>>>>       3463 =C2=B1 10%     -61.4%       1335 =C2=B1 17%      -3.0%     =
  3359 =C2=B1  2%  ftq.noise.50%
>>>>       1116 =C2=B1 23%     -73.7%     293.90 =C2=B1 30%     -23.8%     =
850.69 =C2=B1 17%  ftq.noise.75%
>>>
>>> To be honest, I was expecting at least the same level of improvement
>>> as the previous patch if not better but i was not expecting worse
>>> results
>>
>> What's your next plan for this regression?  At least your previous patch
>> could recover part of it.
>
> I haven't been able to find better fix than the previous patch so i'm
> going to send a clean version with proper commit message

Great to know this.  Could you keep me posted?

Best Regards,
Huang, Ying

> Regards,
> Vincent
>
>>
>> Best Regards,
>> Huang, Ying

--===============3301883609344879994==--

