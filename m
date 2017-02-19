Content-Type: multipart/mixed; boundary="===============6937608185972291967=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [clear_page] 0ad07c8104 BUG: unable to handle kernel NULL pointer dereference at 0000000000000040
Date: Sun, 19 Feb 2017 09:06:51 +0800
Message-ID: <20170219010651.nsxugr7j6exvh3wn@wfg-t540p.sh.intel.com>
In-Reply-To: <20170219001047.ivdkkkmrml6bh5v3@pd.tnic>
List-Id: <oe-lkp.lists.linux.dev>

--===============6937608185972291967==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 19, 2017 at 01:10:47AM +0100, Borislav Petkov wrote:
>Hey Fengguang,
>
>On Sun, Feb 19, 2017 at 07:29:50AM +0800, Fengguang Wu wrote:
>> Good point! I noticed it too while sending out the report. It'll be
>> showed as this in future:
>>
>>        https://github.com/0day-ci/linux/commits/Borislav-Petkov/x86-Opti=
mize-clear_page/20170210-053052
>
>How about pointing to the patch directly?
>
>https://github.com/0day-ci/linux/commit/0ad07c8104eb5c12dfcb86581c1cc65718=
3496cc

Yes if we add it as a line below the branch URL, it could be a time saver.

>> Sorry the 2nd report was send out manually and I only checked the
>> emails in my _current_ mbox. Since the previous report email has been
>> archived, it slipped through the duplication check.
>
>No worries - this was all a prelude to me hinting at the email-based
>talking to the bot :-)
>
>> CC Xiaolong. It's possible to automate the test-of-fixup-patches.
>> Firstly find out the original email report by the Message-ID being
>> replied to. Then fetch all the information required for deciding where
>> the patch should be applied to, parameters to auto-testing the patch.
>
>Sounds like a plan.
>
>It would probably even be easier for the bot if the reply-mail contained
>specially-formatted hints like:
>
>TEST-WITH-BELOW-PATCH: ...
>
>or so.

Since it's hard to teach ALL people about the rule, it'd be best if we
can work w/o any rules -- unless you want to be accurate&helpful or to
customize test behaviors.

Since we already tested the original patch/commit (hence the report),
we should know where the fixup should be applied to. And it'd be
reasonably easy to tell whether the fix is incremental or a
replacement -- just try git-am onto the original commit first, if
failed, continue to try the parent commit. For old bugs the fix could
be against linus/master or linux-next/master, which could be tried too.

>Btw, another nice aspect of this talking back to the bot is that before
>I, as a recipient of the bug report, go and try to prepare a guest or
>find a machine to reproduce properly, I can send a quick diff to the bot
>in the meantime and say, "try this on the guest. I have a hunch it might
>fix it."

Yes, that'd be most convenient. In general the email interface could
be something like this:

        # "key: value" fields; if you Re: to an earlier bug report, they ca=
n be auto retrieved
        compiler: gcc-6 # optional
        base-commit: v4.10-rc8 # the robot knows kernel commits from hundre=
ds of public git trees
        ---
        the patch
        ---
        attach kconfig files

>> Yeah we have a TODO to do email based on-demand service, which looks
>> close to your proposal.
>
>Cool. Ping me if you need testers.
>
>Thanks!

Thanks,
Fengguang

--===============6937608185972291967==--

