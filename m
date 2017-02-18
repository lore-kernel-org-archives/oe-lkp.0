Content-Type: multipart/mixed; boundary="===============0610569621278573767=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [clear_page] 0ad07c8104 BUG: unable to handle kernel NULL pointer dereference at 0000000000000040
Date: Sun, 19 Feb 2017 07:29:50 +0800
Message-ID: <20170218232950.picqhk2xlmx3uh4l@wfg-t540p.sh.intel.com>
In-Reply-To: <20170218144759.bqdy3ugj45uh36zc@pd.tnic>
List-Id: <oe-lkp.lists.linux.dev>

--===============0610569621278573767==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Borislav,

On Sat, Feb 18, 2017 at 03:48:00PM +0100, Borislav Petkov wrote:
>Guys,
>
>please fix the 0day bot reporting. See below for more info.
>
>On Sat, Feb 18, 2017 at 01:01:53PM +0800, Fengguang Wu wrote:
>> Greetings,
>>
>> 0day kernel testing robot got the below dmesg and the first bad commit is
>>
>> https://github.com/0day-ci/linux Borislav-Petkov/x86-Optimize-clear_page=
/20170210-053052
>
>Can you make this point to the actual commit on github?
>
>Your tree there has currently 47K branches and navigating through the
>web interface takes forever.

Good point! I noticed it too while sending out the report. It'll be
showed as this in future:

        https://github.com/0day-ci/linux/commits/Borislav-Petkov/x86-Optimi=
ze-clear_page/20170210-053052

>> commit 0ad07c8104eb5c12dfcb86581c1cc657183496cc
>> Author:     Borislav Petkov <bp@suse.de>
>> AuthorDate: Thu Feb 9 20:51:25 2017 +0100
>> Commit:     0day robot <fengguang.wu@intel.com>
>> CommitDate: Fri Feb 10 05:30:58 2017 +0800
>>
>>      x86: Optimize clear_page()
>>
>>      Currently, we CALL clear_page() which then JMPs to the proper funct=
ion
>>      chosen by the alternatives.
>>
>>      What we should do instead is CALL the proper function directly. (Th=
is
>>      was something Ingo suggested a while ago). So let's do that.
>>
>>      Measuring our favourite kernel build workload shows that there are =
no
>>      significant changes in performance.
>>
>>      ...
>>
>>      Signed-off-by: Borislav Petkov <bp@suse.de>
>
>Then, this is an old patch. You already sent me a bug report, I replied
>with a fix but you didn't test the fix. Instead you're sending the same
>old report.

Sorry the 2nd report was send out manually and I only checked the
emails in my _current_ mbox. Since the previous report email has been
archived, it slipped through the duplication check.

>Here's the fix: https://lists.01.org/pipermail/lkp/2017-February/005573.ht=
ml
>
>And the upstream submission of the new version:
>
>https://lkml.kernel.org/r/20170215111927.emdgxf2pide3kwro(a)pd.tnic
>
>Please fix the bot to pay attention to replies. If there is a special
>way I should reply with a fix so that the bot retests with the same
>config, please let me know.

CC Xiaolong. It's possible to automate the test-of-fixup-patches.
Firstly find out the original email report by the Message-ID being
replied to. Then fetch all the information required for deciding where
the patch should be applied to, parameters to auto-testing the patch.

>In general, I think it would be a very cool idea to be able to reply to
>the bot and say, "Dear bot, can you test this fix ontop with the exact
>same guest, vm, kernel .config etc.
>
>That would be lovely.

Yeah we have a TODO to do email based on-demand service, which looks
close to your proposal.

>Thanks and keep up the good work!

Thanks,
Fengguang

--===============0610569621278573767==--

