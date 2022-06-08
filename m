Content-Type: multipart/mixed; boundary="===============1223444779817769891=="
MIME-Version: 1.0
From: Willy Tarreau <w@1wt.eu>
To: lkp@lists.01.org
Subject: Re: [tcp] e926147618: stress-ng.icmp-flood.ops_per_sec -8.7% regression
Date: Wed, 08 Jun 2022 09:34:41 +0200
Message-ID: <20220608073441.GE7547@1wt.eu>
In-Reply-To: <CACi_AuAr70bDB79zg9aAF1rD7e1qGgFwCGCAPYtS-zCp_zA0iw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1223444779817769891==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 08, 2022 at 10:26:12AM +0300, Moshe Kol wrote:
> Hmm, How is the ICMP flood stress test related to TCP connections?

To me it's not directly related, unless the test pre-establishes many
connections, or is affected in a way or another by a larger memory
allocation of this part.

Willy
--===============1223444779817769891==--

