Content-Type: multipart/mixed; boundary="===============8509331292646414297=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: Testing for POSIX shell compliance?
Date: Wed, 27 Jul 2016 11:41:54 +0800
Message-ID: <20160727034154.GA22290@wfg-t540p.sh.intel.com>
In-Reply-To: <CA+r1ZhiAR3fDk9gd17yxm-goktNMQWnq5iwQsHFVVaWT6aRUTA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8509331292646414297==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Jim,

On Tue, Jul 26, 2016 at 08:37:28PM -0700, Jim Davis wrote:
>Hi -- while looking into a problem building the Linux kernel using the
>dash shell, I was given to understand that any POSIX-compliant shell
>should work, and Bash-specific features should be avoided in kernel
>shell scripts.  Does -- or could -- the 0-day tests include builds
>with non-Bash shells like dash or posh to check for Bash-isms?

Sure. Will it be enough to symlink /bin/sh to dash?
Currently the symlink is bash.

Thanks,
Fengguang

--===============8509331292646414297==--

