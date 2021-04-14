Content-Type: multipart/mixed; boundary="===============5688214731785460830=="
MIME-Version: 1.0
From: Andi Kleen <ak@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2 00/16] Multigenerational LRU Framework
Date: Wed, 14 Apr 2021 08:56:47 -0700
Message-ID: <20210414155647.GV3762101@tassilo.jf.intel.com>
In-Reply-To: <93308ea276cfe7997c29ce7132516e830e8fec40.camel@surriel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5688214731785460830==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> Now imagine we have an 8 node system, and memory
> pressure in the DMA32 zone of node 0.

The question is how much do we still care about DMA32.
If there are problems they can probably just turn on the IOMMU for
these IO mappings.

-Andi
--===============5688214731785460830==--

