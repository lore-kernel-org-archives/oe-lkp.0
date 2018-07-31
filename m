Content-Type: multipart/mixed; boundary="===============8468747276495953611=="
MIME-Version: 1.0
From: Joerg Roedel <jroedel@suse.de>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [confidence: ] 7757d607c6 [ 56.996267] BUG: Bad page map in process trinity-c2 pte:0d755065 pmd:0d55b067
Date: Tue, 31 Jul 2018 09:27:25 +0200
Message-ID: <20180731072725.ecbhfm6642xxao5z@suse.de>
In-Reply-To: <20180731020036.GB22500@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============8468747276495953611==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 31, 2018 at 10:00:36AM +0800, Ye Xiaolong wrote:
> On 07/27, Joerg Roedel wrote:
> >May I ask how this was bisected? I found it very hard to reproduce, it
> >triggered less then two times a day with the attached reproducer. Given
> >that the report came pretty fast after the patches landed in
> >tip/x86/pti, I guess it triggered a lot faster in your testing.
> >
> =

> There is higher reproduce rate (2/310) in 0day environment, and we got do=
zens
> of qemu running simultaneously for bisection thus can get bisect result p=
romptly.

Ah okay, that makes sense. Thanks for your answer and thanks for the
report again.


Regards,

	Joerg


--===============8468747276495953611==--

