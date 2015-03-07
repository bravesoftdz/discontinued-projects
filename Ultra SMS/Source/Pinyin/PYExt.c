#include <ctype.h>
#include <string.h>
#include <memory.h>
#include "Library\GetGBKPY.H"
#include "PYExt.h"

// ������ֵ�ƴ��
int GetCharacterPinyin(const char *lpInput, char *lpBuffer, unsigned int lLength)
{
	DWORD HZ = 0;
	HZ = (DWORD)(*(unsigned char *)lpInput << 8) + (DWORD)(*(unsigned char *)(lpInput + 1));
	return GetPY(HZ, lpBuffer, lLength);
}

int IsAlphaEquals(char c1, char c2)
{
	return toupper(c1) == tolower(c2);
}

char*   toLowerString(char*   szSource)  
{  
	char*   szString   =   szSource;  
	while   (*szString)  
	{  
		if   (isupper(*szString))  
		{  
			*szString   =   tolower(*szString);  
		}  
		szString++;  
	}  
	return   szSource;  
}  

char*   toUpperString(char*   szSource)  
{  
	char*   szString   =   szSource;  
	while   (*szString)  
	{  
		if   (islower(*szString))  
		{  
			*szString   =   toupper(*szString);  
		}  
		szString++;  
	}  
	return   szSource;  
  }   

// �Ƿ����ַ��ϼ�ƴ
int IsSimpleSpellingMatch(const char *lpString, const char *lpSimpleSpelling)
{
	// ����
	char uChar = 0;
	char bufSpelling[PYLEN];
	const char *itr, *firstpos;
	int TrySimpleSpelling = 1;
	int Mismatched = 0;
	
	// �����ƴ����򷵻���
	if (*lpSimpleSpelling == 0)
		return 1;
	
	// �鿴��һ����
	uChar = *lpString;

	if (uChar == 0)
		// ���û���ַ����ˣ������м�ƴ�����ط�
		return 0;
	else if (isalpha(uChar))
	{
		// ��Ӣ����ĸ
		if (uChar == *lpSimpleSpelling)
			return IsSimpleSpellingMatch(++lpString, ++lpSimpleSpelling);
		else
			return 0;
	}
	else if (isdigit(uChar))
	{
		// ����
		if (uChar == *lpSimpleSpelling)
			return IsSimpleSpellingMatch(++lpString, ++lpSimpleSpelling);
		else
			return 0;
	}
	else if (uChar & 0x80)
	{
		// ˫�ֽڱ��룬��ú��ֵ�ƴ��
		if (GetCharacterPinyin(lpString, bufSpelling, PYLEN))
		{
			itr = bufSpelling;
			TrySimpleSpelling = 1;

			while (*itr)
			{
				firstpos = lpSimpleSpelling;

				if (TrySimpleSpelling)
				{
					// ���Լ�ƴ
					if (*itr == *lpSimpleSpelling)
						if (IsSimpleSpellingMatch(lpString+2, ++firstpos))
							return 1;
				}
				else
				{
					// ��������ƴ��
					Mismatched = 0;

					// ƥ��ƴ��
					while ((*itr != ' ') && (*itr != 0) && (firstpos != 0))
					{
						if (*itr != *firstpos) 
						{
							Mismatched = 1;
							break;
						}

						itr++, firstpos++;
					}

					// ƥ����ֵ����ƥ��ʧ�ܻ�֮��Ҳ����ƥ��
					if (!Mismatched && IsSimpleSpellingMatch(lpString + 2, firstpos))
						return 1;
					else
						Mismatched = 1;
					
					// �����ƥ���Ҫ��ָ���Ƶ���һ��ƴ����λ��
					itr++;
					while (Mismatched && (*itr != 0) && (*(itr-1) != ' '))
						itr++;
				}

				TrySimpleSpelling = !TrySimpleSpelling;
			}

			// ����֮��û��ƥ���
			return 0;
		}
		else
			// �޷������ַ���������һ��
			return IsSimpleSpellingMatch(lpString+2, lpSimpleSpelling);
	}
	else
	{
		// �޷������ַ�������һ�ַ�
		return IsSimpleSpellingMatch(++lpString, lpSimpleSpelling);
	}
}

int IsSimpleSpellingMatchCaseInsensitive(const char *lpString, const char *lpSimpleSpelling)
{
	char *lpStringCopy;
	char *lpSimpleSpellingCopy;
	int result;

	lpStringCopy = malloc(512);
	lpSimpleSpellingCopy = malloc(512);

	strncpy(lpStringCopy, lpString, 512);
	strncpy(lpSimpleSpellingCopy, lpSimpleSpelling, 512);

	toLowerString(lpStringCopy);
	toLowerString(lpSimpleSpellingCopy);

	result = IsSimpleSpellingMatch(lpStringCopy, lpSimpleSpellingCopy);

	free(lpStringCopy);
	free(lpSimpleSpellingCopy);

	return result;
}