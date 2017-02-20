Content-Type: multipart/mixed; boundary="===============0620844159149989134=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [clear_page] 0ad07c8104 BUG: unable to handle kernel NULL pointer dereference at 0000000000000040
Date: Mon, 20 Feb 2017 11:03:52 +0800
Message-ID: <20170220030352.fksjiy6ktuxwtvdg@wfg-t540p.sh.intel.com>
In-Reply-To: <20170219135019.tiaed3zl5t5vr45k@pd.tnic>
List-Id: <oe-lkp.lists.linux.dev>

--===============0620844159149989134==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Borislav,

On Sun, Feb 19, 2017 at 02:50:19PM +0100, Borislav Petkov wrote:
>On Sun, Feb 19, 2017 at 09:06:51AM +0800, Fengguang Wu wrote:
>> Yes if we add it as a line below the branch URL, it could be a time save=
r.
>
>Right.
>
>> Since it's hard to teach ALL people about the rule, it'd be best if we
>> can work w/o any rules -- unless you want to be accurate&helpful or to
>> customize test behaviors.
>>
>> Since we already tested the original patch/commit (hence the report),
>> we should know where the fixup should be applied to. And it'd be
>> reasonably easy to tell whether the fix is incremental or a
>> replacement -- just try git-am onto the original commit first, if
>> failed, continue to try the parent commit. For old bugs the fix could
>> be against linus/master or linux-next/master, which could be tried too.
>
>Makes sense.
>
>> Yes, that'd be most convenient. In general the email interface could
>> be something like this:
>>
>>        # "key: value" fields; if you Re: to an earlier bug report, they =
can be auto retrieved
>>        compiler: gcc-6 # optional
>>        base-commit: v4.10-rc8 # the robot knows kernel commits from hund=
reds of public git trees
>>        ---
>>        the patch
>>        ---
>>        attach kconfig files
>
>Yap, just stick those rules somewhere on a website.

OK, will do when the feature is ready. According to Xiaolong, the
automated test-of-fixup-patches feature is already in our plan.

For introductions of the now-working build/boot test services and
instructions on customization, we could probably add some markdown
document under

        https://github.com/fengguang/lkp-tests/tree/master/doc

Philip/Ying, what do you think? I can draft it.

>Btw, this is not only useful for a follow-on, fix patch but also for
>initial test request. For example, I want to backport patch to stable
>and would like to run it on a bunch of kernels:
>
>base-commit: v4.4-stable, v4.9-stable, ...
>
>i.e., a list of trees to apply it to. I believe people might like this a
>lot.
>
>Or, for example, a patch touching a bunch of arches and author doesn't
>necessarily have access to all those different toolchains. Shoot a mail
>to the 0day bot:
>
>base-commit: linus/master
>arch: x86_64, powerpc, sparc, ...
>
>Would be very useful too.

We actually already test LKML patch in that way (Xiaolong maintains
this feature). Nevertheless if developers specify "base-commit:" it
could help eliminate the guessing works by the dumb robot. We'll
appreciate if the "base-commit:" or "base-patchid:" tags are listed
in the patches, especially in some non-obvious situations.

Such tags could be regarded as "explicit" test requests, where we could
send "BUILD COMPLETE" emails as a response (comparing to our normal
LKML patch tests, which only build regressions will trigger an email
notification).

>Anyway, just a couple of ideas.
>
>What would also be cool if you guys had a 0day bot howto with all those
>things we should pay attention to and we can go and look up.

OK. Your ideas are very welcome, thanks!

Regards,
Fengguang

--===============0620844159149989134==--

