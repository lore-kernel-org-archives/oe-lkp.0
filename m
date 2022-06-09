Content-Type: multipart/mixed; boundary="===============8692923396258309513=="
MIME-Version: 1.0
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: lkp@lists.01.org
Subject: Re: [mm] 9b12e49e9b: BUG:Bad_page_state_in_process
Date: Thu, 09 Jun 2022 12:45:05 +0800
Message-ID: <59676cdf-a719-efcd-d5c1-b43198dc4348@linux.alibaba.com>
In-Reply-To: <YqC7K0e2FFp7vT6i@casper.infradead.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============8692923396258309513==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 6/8/2022 11:07 PM, Matthew Wilcox wrote:
> On Wed, Jun 08, 2022 at 10:38:19PM +0800, kernel test robot wrote:
>>
>>
>> Greeting,
>>
>> FYI, we noticed the following commit (built with gcc-11):
>>
>> commit: 9b12e49e9b02bbaca8041f236a6b2fd4586d45c8 ("[RFC PATCH 3/3] mm: A=
dd kernel PTE level pagetable pages account")
> =

>> [   75.338681][ T4873] BUG: Bad page state in process 444  pfn:20b066
>> [   75.338840][ T4873] page:0000000016cf0259 refcount:0 mapcount:-512 ma=
pping:0000000000000000 index:0x0 pfn:0x20b066
> =

> mapcount:-512 is PG_table.  Somebody forgot to call
> pgtable_pte_page_dtor() (or similar)

Right. Thanks for reminding. :)
--===============8692923396258309513==--

