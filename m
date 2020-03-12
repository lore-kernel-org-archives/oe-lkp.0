Content-Type: multipart/mixed; boundary="===============4004601359710796599=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v3 1/2] modpost: rework and consolidate logging interface
Date: Thu, 12 Mar 2020 00:51:59 +0000
Message-ID: <6637fe72-b7e5-2259-5eeb-055cf50382b8@intel.com>
In-Reply-To: <CAK7LNAQM1WF1rk5H+26J87-jC4ghYvdEs1UQSNy+C87myS94DQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4004601359710796599==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 3/11/20 9:00 AM, Masahiro Yamada wrote:
> On Wed, Mar 11, 2020 at 12:56 AM Philip Li <philip.li@intel.com> wrote:
>> On Tue, Mar 10, 2020 at 12:32:00PM +0100, Jessica Yu wrote:
>>> +++ Masahiro Yamada [09/03/20 20:03 +0900]:
>>>> On Mon, Mar 9, 2020 at 7:58 PM Jessica Yu <jeyu@kernel.org> wrote:
>>>>> +++ Masahiro Yamada [09/03/20 19:49 +0900]:
>>>>>> On Mon, Mar 9, 2020 at 7:39 PM Jessica Yu <jeyu@kernel.org> wrote:
>>>>>>> Ah, sorry, I mean the kbuild 0-day bot errors. I am just realizing
>>>>>>> the 0-day bot emails are not CC'd to lkml. Here is the error I got
>>>>>>> from the bot:
>>>>>>>
>>>>>>> ---
>>>>>>>
>>>>>>> I love your patch! Yet something to improve:
>>>>>>>
>>>>>>> [auto build test ERROR on linus/master]
>>>>>>> [also build test ERROR on v5.6-rc4 next-20200306]
>>>>>>> [if your patch is applied to the wrong git tree, please drop us a n=
ote to help
>>>>>>> improve the system. BTW, we also suggest to use '--base' option to =
specify the
>>>>>>> base tree in git format-patch, please see https://stackoverflow.com=
/a/37406982]
>>>>>>>
>>>>>>> url:    https://github.com/0day-ci/linux/commits/Jessica-Yu/modpost=
-rework-and-consolidate-logging-interface/20200307-052346
>>>>>>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/li=
nux.git 30fe0d07fd7b27d41d9b31a224052cc4e910947a
>>>>>>> config: sh-randconfig-a001-20200306 (attached as .config)
>>>>>>> compiler: sh4-linux-gcc (GCC) 7.5.0
>>>>>>> reproduce:
>>>>>>>          wget https://raw.githubusercontent.com/intel/lkp-tests/mas=
ter/sbin/make.cross -O ~/bin/make.cross
>>>>>>>          chmod +x ~/bin/make.cross
>>>>>>>          # save the attached .config to linux build tree
>>>>>>>          GCC_VERSION=3D7.5.0 make.cross ARCH=3Dsh
>>>>>>>
>>>>>>> If you fix the issue, kindly add following tag
>>>>>>> Reported-by: kbuild test robot <lkp@intel.com>
>>>>>>>
>>>>>>> All errors (new ones prefixed by >>):
>>>>>>>
>>>>>>>>> ERROR: modpost: "adc_single" [arch/sh/boards/mach-hp6xx/hp6xx_apm=
.ko] undefined!
>>>>>>
>>>>>> Indeed, this one is odd.
>>>>>> I have no idea...
>>>>> I've pushed the patches to a branch to let the kbuild bot run through=
 its
>>>>> build tests again, and if I have extra time today I will try to
>>>>> reproduce this and let you know the results.
>>>>>
>>>>> Thanks,
>>>>>
>>>>> Jessica
>>>>
>>>> Ah, Now I see.
>>>>
>>>>
>>>> Because you added "modpost:" prefix.
>>>>
>>>>
>>>>
>>>> The previous error message:
>>>>
>>>> ERROR: "adc_single" [arch/sh/boards/mach-hp6xx/hp6xx_apm.ko] undefined!
>>>>
>>>>
>>>> The new error message:
>>>>
>>>> ERROR: modpost: "adc_single" [arch/sh/boards/mach-hp6xx/hp6xx_apm.ko] =
undefined!
>>>>
>>>>
>>>>
>>>> So, the bot assumed it was a new error.
>>> Nice catch! Hm, I suppose we need to let the LKP folks know about the
>>> change in error message. CC'd LKP mailing list.
>> Thanks for the info, we will look into this to handle the
>> changed error.
>>
>>> Jessica
>>> _______________________________________________
>>> LKP mailing list -- lkp(a)lists.01.org
>>> To unsubscribe send an email to lkp-leave(a)lists.01.org
>
>
> Could you improve the report by adding more context?
>
> Currently, only new errors/warnings are shown by '>>'.
>
>
> If fixed ones had been shown by '<<',
> we would have easily noticed that
> this was just a matter of message format.
>
> << ERROR: "adc_single" [arch/sh/boards/mach-hp6xx/hp6xx_apm.ko] undefined!
>>> ERROR: modpost: "adc_single" [arch/sh/boards/mach-hp6xx/hp6xx_apm.ko] u=
ndefined!

Hi,

Thanks for your advice, we'll add it into our todo list.

Best Regards,
Rong Chen
--===============4004601359710796599==--

