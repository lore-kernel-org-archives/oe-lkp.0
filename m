Content-Type: multipart/mixed; boundary="===============2300772844498979108=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [ipc/msg] 72d1e61108: stress-ng.msg.ops_per_sec 262.8% improvement
Date: Wed, 12 Oct 2022 12:26:11 -0700
Message-ID: <20221012122611.3ab2deb4a00c92ef45be5872@linux-foundation.org>
In-Reply-To: <202210121629.587ff60f-yujie.liu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2300772844498979108==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 12 Oct 2022 16:30:20 +0800 kernel test robot <yujie.liu@intel.com=
> wrote:

> FYI, we noticed a 262.8% improvement of stress-ng.msg.ops_per_sec due to =
commit:
> =

> commit: 72d1e611082eda18689106a0c192f2827072713c ("ipc/msg: mitigate the =
lock contention with percpu counter")

Awesome, thanks!
--===============2300772844498979108==--

