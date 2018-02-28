Content-Type: multipart/mixed; boundary="===============0291682543672083022=="
MIME-Version: 1.0
From: Pavel Tatashin <pasha.tatashin@oracle.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm] df2af627c7: BUG:sleeping_function_called_from_invalid_context_at_include/linux/percpu-rwsem.h
Date: Tue, 27 Feb 2018 23:10:11 -0500
Message-ID: <CAGM2reaamXezTubHyPGoOKwE8GmXTf+jxbs2Nyhecfd2VC3yXw@mail.gmail.com>
In-Reply-To: <20180228011406.h7uov7426ywdftkd@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============0291682543672083022==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thank you for the report. I have successfully reproduced the bug:

|
BUG:sleeping_function_called_from_invalid_context_at_include/linux/percpu-r=
wsem.h
| 0          | 19         |

Studying.

Thank you,
Pavel

--===============0291682543672083022==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdj5UaGFuayB5b3UgZm9yIHRoZSByZXBvcnQuIEkgaGF2ZSBzdWNj
ZXNzZnVsbHkgcmVwcm9kdWNlZCB0aGUgYnVnOjwvZGl2PjxkaXY+PGJyPjwvZGl2PnwgQlVHOnNs
ZWVwaW5nX2Z1bmN0aW9uX2NhbGxlZF9mcm9tX2ludmFsaWRfY29udGV4dF9hdF9pbmNsdWRlL2xp
bnV4L3BlcmNwdS1yd3NlbS5oIHwgMMKgIMKgIMKgIMKgIMKgIHwgMTnCoCDCoCDCoCDCoCDCoHw8
YnI+PGRpdj48YnI+PC9kaXY+PGRpdj5TdHVkeWluZy48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2
PlRoYW5rIHlvdSw8L2Rpdj48ZGl2PlBhdmVsPC9kaXY+PC9kaXY+Cg==

--===============0291682543672083022==--

