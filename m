Content-Type: multipart/mixed; boundary="===============9100392484338590654=="
MIME-Version: 1.0
From: Borislav Petkov <bp@alien8.de>
To: lkp@lists.01.org
Subject: Re: [x86/copy_user] adb402cd14: will-it-scale.per_process_ops -12.7% regression
Date: Tue, 15 Nov 2016 11:01:01 +0100
Message-ID: <20161115100101.nzvhd5mlcb747n2h@pd.tnic>
In-Reply-To: <20161114143711.GB2852@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============9100392484338590654==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 14, 2016 at 10:37:11PM +0800, Ye Xiaolong wrote:
> Below cmd should help on it:

Right, before I go do this, can you please retest without

CONFIG_DEBUG_ATOMIC_SLEEP=3Dy

?

Thanks.

-- =

Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.

--===============9100392484338590654==--

