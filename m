Content-Type: multipart/mixed; boundary="===============5721158601781217733=="
MIME-Version: 1.0
From: Steven Rostedt <rostedt@goodmis.org>
To: lkp@lists.01.org
Subject: Re: [irqflags] 21db66c4ff: will-it-scale.per_process_ops -4.5% regression
Date: Thu, 27 May 2021 20:59:51 -0400
Message-ID: <20210527205951.2490d75b@oasis.local.home>
In-Reply-To: <20210525070354.GD7744@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============5721158601781217733==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 25 May 2021 15:03:54 +0800
kernel test robot <oliver.sang@intel.com> wrote:

> FYI, we noticed a -4.5% regression of will-it-scale.per_process_ops due t=
o commit:

As Mark explained, your patch was not a nop. And the 0day bot just
showed you why we didn't do it the way you suggested.

-- Steve
--===============5721158601781217733==--

