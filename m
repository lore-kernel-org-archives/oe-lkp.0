Content-Type: multipart/mixed; boundary="===============0614569136431639921=="
MIME-Version: 1.0
From: Johannes Berg <johannes@sipsolutions.net>
To: lkp@lists.01.org
Subject: Re: [fortify] 54d9469bc5: WARNING:at_net/wireless/wext-core.c:#wireless_send_event
Date: Tue, 11 Oct 2022 08:59:49 +0200
Message-ID: <0d8be2bcb891a56c42760c8e955877841046458b.camel@sipsolutions.net>
In-Reply-To: <202210102312.1CC8197@keescook>
List-Id: <oe-lkp.lists.linux.dev>

--===============0614569136431639921==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 2022-10-10 at 23:17 -0700, Kees Cook wrote:
> On Tue, Oct 11, 2022 at 11:46:21AM +0800, kernel test robot wrote:
> > commit: 54d9469bc515dc5fcbc20eecbe19cea868b70d68 ("fortify: Add run-tim=
e WARN for cross-field memcpy()")
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> > [...]
> > caused below changes (please refer to attached dmesg/kmsg for entire lo=
g/backtrace):
> > [...]
> > [   95.913726][   T36] memcpy: detected field-spanning write (size 16) =
of single field "&compat_event->pointer" at net/wireless/wext-core.c:623 (s=
ize 4)
> =

> This was fixed with:
> e3e6e1d16a4c ("wifi: wext: use flex array destination for memcpy()")
> =

> I expect this will land before -rc1 closes, but Johannes will know more
> about the schedule.
> =


Yes, we're planning to send a pull request today, so that should go to
Linus with the net pull request tomorrow.

johannes
--===============0614569136431639921==--

