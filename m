Content-Type: multipart/mixed; boundary="===============8927698451937619454=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: Re: [libata] a234f7395c: BUG:sleeping_function_called_from_invalid_context_at_mm/slab.h
Date: Sat, 14 Jan 2017 08:32:21 +0100
Message-ID: <20170114073221.GA20029@lst.de>
In-Reply-To: <20170113222659.GA105338@inn.lkp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8927698451937619454==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Ok, plain GFP_NOFS allocations obviously don't do it inside
->queuecommand context.  I'll cook up a fix later today.

--===============8927698451937619454==--

