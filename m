Content-Type: multipart/mixed; boundary="===============4434819920715749088=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: email/patch test requests to 0day robot
Date: Tue, 21 Feb 2017 08:00:37 +0800
Message-ID: <20170221000037.pnk22hcfv5hbvs2i@wfg-t540p.sh.intel.com>
In-Reply-To: <20170220093551.crucsscnh5zvd2si@pd.tnic>
List-Id: <oe-lkp.lists.linux.dev>

--===============4434819920715749088==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 20, 2017 at 10:35:51AM +0100, Borislav Petkov wrote:
>On Mon, Feb 20, 2017 at 11:03:52AM +0800, Fengguang Wu wrote:
>> We actually already test LKML patch in that way (Xiaolong maintains
>> this feature). Nevertheless if developers specify "base-commit:" it
>> could help eliminate the guessing works by the dumb robot. We'll
>> appreciate if the "base-commit:" or "base-patchid:" tags are listed
>> in the patches, especially in some non-obvious situations.
>
>Can I specify multiple base commits for testing stable backports?
>
>For example
>
>base-commit: v4.9.11, v4.4.50, v3.10.105,...

That's reasonable and useful form. BTW for stable testing, it could
be more convenient to specify the branch names:

        stable/linux-4.9.y
        stable/linux-4.4.y
        stable/linux-3.10.y

There is also the RC stable tree available:

        linux-stable-rc/linux-4.9.y
        linux-stable-rc/linux-4.4.y

BTW it looks a bit inconsistent about the tree names "stable" and
"linux-stable-rc". These are the current names the robot refer to each
git tree:

https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/tree/repo/li=
nux/stable
https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/tree/repo/li=
nux/linux-stable-rc

I could rename the latter to "stable-rc" if no other opinions.

>> Such tags could be regarded as "explicit" test requests, where we could
>> send "BUILD COMPLETE" emails as a response (comparing to our normal
>> LKML patch tests, which only build regressions will trigger an email
>> notification).
>
>Yap, similar to those you guys sent when a new branch on k.org has been
>tested.

Yes.

>Btw, can we make the format layout this way:
>
>patch
>
>---
>
><0day bot tags>
>
>---
>
>so that when we send it to lkml, it doesn't interfere with review by
>slapping the tags at the beginning of the patch?

Sure. In fact we currently search for the tags in the whole email body.

>Also, should we CC some special mailing list which the 0day bot parses
>or lkml is enough?

There are dozens of mailing lists monitored, so the CC could grow too
large to look "normal". So I changed the email subject to make it more
obvious to people.

>Cool stuff.

Thank you!
Fengguang

--===============4434819920715749088==--

