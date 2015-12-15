Content-Type: multipart/mixed; boundary="===============7176118594135597668=="
MIME-Version: 1.0
From: Borislav Petkov <bp@alien8.de>
To: lkp@lists.01.org
Subject: Re: [x86/irq] 4c24cee6b2: IP-Config: Auto-configuration of network failed
Date: Tue, 15 Dec 2015 11:08:19 +0100
Message-ID: <20151215100819.GB25973@pd.tnic>
In-Reply-To: <566FC762.1040107@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7176118594135597668==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 15, 2015 at 03:55:14PM +0800, Jiang Liu wrote:
> Aha, found a possible regression. Could you please help to apply
> the attached bugfix patch ontop of "cc22b9b83f6a x86/irq: Enhance
> __assign_irq_vector() to rollback in case of failure"?

Yap, attached patch seems to work here.

Tested-by: Borislav Petkov <bp@suse.de>

Thanks!

-- =

Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.

--===============7176118594135597668==--

