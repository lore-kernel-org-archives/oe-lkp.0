Content-Type: multipart/mixed; boundary="===============3979296714299365003=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Fri, 12 Aug 2016 00:08:54 +0200
Message-ID: <20160811220854.GA30146@lst.de>
In-Reply-To: <CA+55aFx=mbAd0hEnji-TWZH_NReLLk+SbJHK1s+=r1_USV0KXw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3979296714299365003==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I'll need to dig into what AIM7 actually does in this benchmark, which
isn't too easy as I'm on a business trip currently, but from the list
below it looks like it keeps overwriting and overwriting a file that's
already been allocated.  This is a pretty stupid workload, but fortunately
it should also be able to be optimized by skipping the actual block
lookup, which is what the old buffer.c code happens to do.

--===============3979296714299365003==--

