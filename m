Content-Type: multipart/mixed; boundary="===============8846462292696713417=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [sched/idle] bb400b924e: fio.write_clat_95%_us -8% improvement
Date: Fri, 07 Apr 2017 14:02:38 +0800
Message-ID: <87inmgah6p.fsf@yhuang-dev.intel.com>
In-Reply-To: <070BEF4AC20468458C22969097656CD94BFB566F@shsmsx102.ccr.corp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8846462292696713417==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

"Li, Aubrey" <aubrey.li@intel.com> writes:

> Please help to take a look:
>
> aubrey(a)inn:~$ lkp queue -b aubrey-fast_idle/4.8.x -k
> ea899bd65fc285d5753d70a7879a7332821bbc02 -t lkp-bdw-ep2 job.yaml -r 3
> -q vip -e aubrey.li(a)intel.com
> aubrey(a)inn:~$ lkp wtmp lkp-bdw-ep2 | grep ea899
> aubrey(a)inn:~$ date
> Fri Apr  7 12:15:02 CST 2017
> aubrey(a)inn:~$ lkp wtmp lkp-bdw-ep2 | grep ea899
> aubrey(a)inn:~$ lkp wtmp lkp-bdw-ep2 | grep ea899
> aubrey(a)inn:~$ date
> Fri Apr  7 13:14:10 CST 2017
>
> I'm running as a VIP and one hour later, I still does not see my task bei=
ng scheduled.
> Anything I did wrong or how to help it manually?
>
> Also, my last task took 10 hr total from scheduled to completion??
> http://bee.sh.intel.com:8080/job/lkp-aubrey-fast-idle/2/
> This is really unacceptable to me, please comment on the time cost.

I found your commit is not correct on inn,

$ cd /c/repo/linux
$ git show git show ea899bd65fc285d5753d70a7879a7332821bbc02
fatal: bad object ea899bd65fc285d5753d70a7879a7332821bbc02

Best Regards,
Huang, Ying

> Thanks,
> -Aubrey
>
>> -----Original Message-----
>> From: Huang, Ying
>> Sent: Friday, April 07, 2017 10:24 AM
>> To: Li, Aubrey
>> Cc: Ye, Xiaolong; Li, Aubrey; lkp(a)01.org; Huang, Ying; Du, Julie; Lu, =
LeiX
>> Subject: Re: [lkp-robot] [sched/idle] bb400b924e: fio.write_clat_95%_us =
-8%
>> improvement
>> =

>> "Li, Aubrey" <aubrey.li@intel.com> writes:
>> =

>> > On Friday, April 07, 2017 9:46 AM, Ye, Xiaolong wrote:
>> >>
>> >> >Can you point me a documentation how to do this?
>> >> >Or can you please show me the detailed steps?
>> >>
>> >> You may refer to lkp-core/doc/performance-work-guide.md.
>> >
>> > Thanks, I'll take a look.
>> >
>> >>
>> >> For simple use, you may
>> >>
>> >> 1) $ lkp queue -b stable/linux-4.8.y -k v4.8.8 -t lkp-bdw-ep2
>> >> job.yaml -r 3 (attached in the original mail or you can use any other
>> >> job.yaml customized)
>> >> 2) $ lkp queue -b fast_idle -k <your head commitid> -t lkp-bdw-ep2
>> >> job.yaml -r 3
>> >> 3) wait above jobs done, you can use `lkp wtmp lkp-bdw-ep2` to check
>> >> the progress
>> >> 4) $ lkp compare -at v4.8.8 <your head commitid> // it will show the
>> >> comparison
>> >>
>> >
>> > Does this guarantee there is no other task running simultaneously when
>> > my task is scheduled?
>> =

>> Yes.
>> =

>> >> >
>> >> Actually this is a bisect report, it bisected to the middle patch in =
your
>> patchset.
>> >> For the HEAD test result, it shares the same parent directory with
>> >> the bisected one, you can see it in
>> >> inn:/result/fio-basic/1SSD-btrfs-300s-8-randwrite-4k-sync-512g-perfor
>> >> mance/lkp
>> >> -bdw-ep2/debian-x86_64-2016-08-31.cgz/x86_64-rhel-7.2/gcc-6/<your
>> >> HEAD
>> >> commitid>
>> >>
>> >
>> > Is there a way not involving bisect process, what I want is
>> > benchmarking my kernel image and done, I really don't care which of my
>> > patch causes a difference, I just care if it's different against a
>> > BASE and I care the time, :)
>> =

>> You can queue tests and compare the results by yourself.  The bisect hap=
pens
>> in background, if you don't care the result, just ignore the result.
>> =

>> Best Regards,
>> Huang, Ying
>> =

>> >
>> >>
>> >> >
>> >> >> >
>> >> >> >(3) I need to dig into the test machine bios to confirm if it's
>> >> >> >compliant to my expected criteria, how to do that?
>> >> >> >
>> >> >>
>> >> >> The test machine is lkp-bdw-ep2, you may ssh into it to check?
>> >> >>
>> >> >
>> >> >ssh is not good enough to me. I need to change the BIOS setting.
>> >> >So I need KVM access (screen + keyboard) and root Privilege of that
>> >> >machine.
>> >>
>> >
>> >
>> >
>> >
>> >
>> >> +Lu Lei
>> >>
>> >> Hi, Lei
>> >>
>> >> Can you help on this?
>> >>
>> >
>> > Thanks,
>> > -Aubrey

--===============8846462292696713417==--

