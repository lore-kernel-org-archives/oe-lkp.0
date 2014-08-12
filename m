Content-Type: multipart/mixed; boundary="===============1405473474669728869=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [nfs] BUG: sleeping function called from invalid context at include/linux/wait.h:976
Date: Tue, 12 Aug 2014 08:59:58 +0200
Message-ID: <20140812065958.GL9918@twins.programming.kicks-ass.net>
In-Reply-To: <7EA40233-6820-4F0E-A2B7-687DC01BDD78@primarydata.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1405473474669728869==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2014 at 10:52:38PM -0400, Weston Andros Adamson wrote:
> Weston Andros Adamson (5):
>  nfs: change nfs_page_group_lock argument
>  nfs: fix nonblocking calls to nfs_page_group_lock
>  nfs: use blocking page_group_lock in add_request
>  nfs: fix error handling in lock_and_join_requests
>  nfs: don't sleep with inode lock in lock_and_join_requests

Thanks for taking care of that!

--===============1405473474669728869==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.sig"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEuNC4xMiAoR05V
L0xpbnV4KQoKaVFJY0JBRUJBZ0FHQlFKVDZidHVBQW9KRUhaSDRhUkx3T1M2VlhJUC9BcU84eFJM
N05PN05WYXZ5d2pwUFY0UQp1TTB1bW1JYUF0WUkvaVVLK3BaOERQbktDQzZaZ0lXcUNxbGFIZWxk
NEFCTUNEOWhLUnRENDJDRml6OTAxbnhwCmxja3pMTXNSeUFQZVlGZlJvdkx3alJ4cndCRndLd3Vw
ZENIQkswK0pyNmlmd3Zyb215YTVieDE5QWdPMSsrMFgKTngyTDdxSDhLRk42Wk5DMHV4ZHZMcmJ3
T2RpV2RRQjJvekN2LzdFRnRFK09CSlhMemZBRmx1SlhwRHRCMGNINwpPQXNyZ3VTbCsrb25lYlhm
RmU1ekRwRmp6U2hwNWhQcjVKZElQVDNSS1E4U2tPVDNFU3FQVWllWWVhRXBuU3dKCnNvVFVycExH
Q2V3ajRlWWpQUTVJM1ROR2RwWVM4ODVGT1pzQmo1K29JSDJVL1NjdXZuVDIrcXpxeHZid09lZnMK
ZnAxL2dpTVdIVG1lMFJETENXUWNPUGJYdnVRRWJoQ0Y1U2dTRWxQNU5KYzBrWUdwc1kxekVoeDRM
RmpaNEg0VQpTUUxwVVl1RFRCYXlRNUx6VXV6MzUyK25udkpsd1NjYnV1S2VHSWpFZDc4SzhsRFA5
NEpEMVVxQUpxYXA0a3FPCmJIMFV5NkhRM3ZjVTBJNXdrR1gxaGpnaTBkSTRoRzdFLzROSm12T0FJ
bE44b0xTeUZqMjBqZFFTUUJkWnNOWjgKR01MRlBSSEZKSVNyQUtuOU1tTGlTWkcyb3VqaFNvd21D
V1dqeUpObS9iQWE3LzlsZm1VNFlFa2dyZ1VtN3NQZgpEQ1pCa0RMcVAzVkFONzZ2UEhpSit4WEp4
T21TT3M2ZXlDVHpRRWs0ZmlpOElHMGZvU05jVnZPd3NCaWk5VE9yClJ1L3IwNUFPUGE2Rk9EUVUr
M3hMCj1vS0ZHCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============1405473474669728869==--

