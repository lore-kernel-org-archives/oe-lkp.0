Content-Type: multipart/mixed; boundary="===============2060482237067187729=="
MIME-Version: 1.0
From: Christoph Lameter <cl@linux.com>
To: lkp@lists.01.org
Subject: Re: [percpu] BUG: unable to handle kernel paging request at 000000000000de40
Date: Mon, 11 Aug 2014 12:42:24 -0500
Message-ID: <alpine.DEB.2.11.1408111241060.14298@gentwo.org>
In-Reply-To: <20140811132213.GA7713@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============2060482237067187729==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 11 Aug 2014, Fengguang Wu wrote:

> This kernel oops happens on a Nehalem-EX machine and is related to
> some commit in the percpu branch(*). I'm not able to bisect it down
> because the machine failed to reboot itself on this oops..

Ok I pushed a fix into the percpu branch. The build should have shown an
issue of a pointer mismatch in __x2apic_send_IPI_mask.

--===============2060482237067187729==--

