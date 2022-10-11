Content-Type: multipart/mixed; boundary="===============8719295816720931611=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: [fortify] 54d9469bc5: WARNING:at_fs/nfs/namespace.c:#nfs_d_automount
Date: Mon, 10 Oct 2022 23:54:01 -0700
Message-ID: <202210102352.B80BC62@keescook>
In-Reply-To: <202210110948.26b43120-yujie.liu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8719295816720931611==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 11, 2022 at 11:45:56AM +0800, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-11):
> =

> commit: 54d9469bc515dc5fcbc20eecbe19cea868b70d68 ("fortify: Add run-time =
WARN for cross-field memcpy()")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> [...]
> [   57.256986][ T4357] memcpy: detected field-spanning write (size 28) of=
 single field "&ctx->nfs_server.address" at fs/nfs/namespace.c:178 (size 16)

Thanks for the report! I've sent a patch for this now:
https://lore.kernel.org/lkml/20221011065243.583650-1-keescook(a)chromium.or=
g/

-- =

Kees Cook
--===============8719295816720931611==--

