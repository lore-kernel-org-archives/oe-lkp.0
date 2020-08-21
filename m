Content-Type: multipart/mixed; boundary="===============8220898788282848881=="
MIME-Version: 1.0
From: Mike Kravetz <mike.kravetz@oracle.com>
To: lkp@lists.01.org
Subject: Re: [hugetlbfs] c0d0381ade: vm-scalability.throughput -33.4% regression
Date: Fri, 21 Aug 2020 16:36:11 -0700
Message-ID: <1f6d321e-96b4-18c3-2991-d6a2e94c9e60@oracle.com>
In-Reply-To: <691152ef-6787-9598-4445-fd2a0164f70f@oracle.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8220898788282848881==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 8/21/20 2:02 PM, Mike Kravetz wrote:
> Would you be willing to test this series on top of 34ae204f1851?  I will =
need
> to rebase the series to take the changes made by 34ae204f1851 into accoun=
t.

Actually, the series in this thread will apply/run cleanly on top of
34ae204f1851.  No need to rebase or port.  If we decide to move forward more
work is required.  See a few FIXME's in the patches.
-- =

Mike Kravetz
--===============8220898788282848881==--

