Content-Type: multipart/mixed; boundary="===============6507157250033757502=="
MIME-Version: 1.0
From: Dave Hansen <dave.hansen@intel.com>
To: lkp@lists.01.org
Subject: Re: [clockevents] d5a085970b0: -9.2% will-it-scale.per_thread_ops
Date: Thu, 26 Jun 2014 14:11:50 -0700
Message-ID: <53AC8C96.7030501@intel.com>
In-Reply-To: <20140626014648.GC12239@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============6507157250033757502==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 06/25/2014 06:46 PM, Fengguang Wu wrote:
> f4f5df6f142f679  d5a085970b0b88b8c82303d2c  =

> ---------------  -------------------------  =

>     773859 ~ 0%      -9.2%     702704 ~ 0%  TOTAL will-it-scale.per_threa=
d_ops

Has this impacted more than a single system?  I wonder if that system
was using the HPET where all the others were using the TSC.

--===============6507157250033757502==--

