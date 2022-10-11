Content-Type: multipart/mixed; boundary="===============1577422025514287451=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: [fortify] 54d9469bc5: WARNING:at_net/wireless/wext-core.c:#wireless_send_event
Date: Mon, 10 Oct 2022 23:17:58 -0700
Message-ID: <202210102312.1CC8197@keescook>
In-Reply-To: <202210110943.6f16f1ea-yujie.liu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1577422025514287451==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 11, 2022 at 11:46:21AM +0800, kernel test robot wrote:
> commit: 54d9469bc515dc5fcbc20eecbe19cea868b70d68 ("fortify: Add run-time =
WARN for cross-field memcpy()")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> [...]
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> [...]
> [   95.913726][   T36] memcpy: detected field-spanning write (size 16) of=
 single field "&compat_event->pointer" at net/wireless/wext-core.c:623 (siz=
e 4)

This was fixed with:
e3e6e1d16a4c ("wifi: wext: use flex array destination for memcpy()")

I expect this will land before -rc1 closes, but Johannes will know more
about the schedule.

-- =

Kees Cook
--===============1577422025514287451==--

