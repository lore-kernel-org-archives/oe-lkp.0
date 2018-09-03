Content-Type: multipart/mixed; boundary="===============5491916756977846598=="
MIME-Version: 1.0
From: Andrey Konovalov <andreyknvl@google.com>
To: lkp@lists.01.org
Subject: Re: 7b5b51e7b3 qemux86-64 login: BUG: kernel hang in boot stage
Date: Mon, 03 Sep 2018 14:45:27 +0200
Message-ID: <CAAeHK+wYt3G4oU1K7XtRZz9e3s_gmLK3dvKB_=VViBpxURs83A@mail.gmail.com>
In-Reply-To: <20180903022954.GB29179@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============5491916756977846598==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 3, 2018 at 4:29 AM, kernel test robot <rong.a.chen@intel.com>=
 wrote:
> Greetings,
>
> 0day kernel testing robot got the below dmesg and the first bad commit is
>
> https://github.com/0day-ci/linux/commits/Andrey-Konovalov/arm64-untag-use=
r-pointers-passed-to-the-kernel/20180831-042151
>
> commit 7b5b51e7b3a988741f7f34d5148f1f4fea86434a
> Author:     Andrey Konovalov <andreyknvl@google.com>
> AuthorDate: Thu Aug 30 13:41:16 2018 +0200
> Commit:     0day robot <lkp@intel.com>
> CommitDate: Fri Aug 31 04:21:59 2018 +0800
>
>     arm64: annotate user pointers casts detected by sparse
>
>     This patch adds __force annotations for __user pointers casts detecte=
d by
>     sparse with the -Wcast-from-as flag enabled (added in [1]).
>
>     [1] https://github.com/lucvoo/sparse-dev/commit/5f960cb10f56ec2017c12=
8ef9d16060e0145f292
>
>     Signed-off-by: Andrey Konovalov <andreyknvl@google.com>

This seems to be a false positive. This patch only adds __force
annotations that doesn't make any difference when not running sparse.
I also don't see any hangs in the attached syslog.

--===============5491916756977846598==--

